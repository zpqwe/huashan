package serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.crypto.hash.SimpleHashRequest;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.aliyuncs.exceptions.ClientException;

import dao.UserMapper;
import entity.TUcAccount;
import entity.TUserData;

import service.UserService;
import util.RedisTemplateUtil;
import util.SerializeUtil;
import util.SmsUtil;


@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource
	@Qualifier("userMapper")
	private UserMapper um;
	
	@Resource
	@Qualifier("redisTemplateUtil")
	private RedisTemplateUtil redisTemplateUtil;

	@Override
	//添加用户
	public void addUser(String phone,String passWord) {
		String head= phone.substring(0, 3);
		String end=phone.substring(7, 11);
		String userName=head+end+"pc181013";
		//将用户名作为盐
		ByteSource salt =ByteSource.Util.bytes(phone);
		//MD5加密
		String md5pwd=new SimpleHash("MD5", passWord, salt, 2).toString();
		System.out.println("md5加密="+md5pwd);
		TUserData user=new TUserData(userName, md5pwd, 1, phone,userName);
		um.addUser(user);
		TUcAccount account=new TUcAccount(user.getUserid(), 0d);
		um.addUserId(account);
	}

	


	@Override
	public TUserData getNewUser(String phone) {
		return um.getNewUser(phone);
	}

	@Override
	public void addUserId(TUcAccount account) {
		um.addUserId(account);
		
	}

	@Override
	public Boolean checkUser(String phone, String passWord) {
		Boolean flag=false;
		TUserData user= getUser(phone);
		if(user!=null && user.getPassword().equals(passWord)){
			flag=true;
		}
		return flag;
	}




	@Override
	public TUserData getUser(String phone) {
		return um.getUser(phone);
	}

	@Override
	//保存验证码在redis缓存中
	public void saveVerCode(String phone)  {
		String key=phone;
		if(redisTemplateUtil.get(key)!=null){
			redisTemplateUtil.del(key);
		}
		Object object = redisTemplateUtil.get(key);
		if(object==null){
			Integer verCode=SmsUtil.getVerCode();
			System.out.println("*********"+verCode);
			try {
				SmsUtil.sendSms(phone,verCode);
			} catch (ClientException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			redisTemplateUtil.set(key, SerializeUtil.serialize(verCode),300);
		}
	}




	@Override
	public Boolean getSMS(String phone,Integer verCode) {
		boolean flag=false;
		byte[] smsBytes = (byte[]) redisTemplateUtil.get(phone);
		if(smsBytes!=null){
			Integer smsCode= (Integer) SerializeUtil.unserialize(smsBytes);
			if(smsCode.equals(verCode)){
				flag=true;
			}
		}
		return flag;
		
	}

	@Override
	public String updatepwd(TUserData user) {
		//将用户名作为盐
		ByteSource salt =ByteSource.Util.bytes(user.getPhone());
		//MD5加密
		String md5pwd=new SimpleHash("MD5", user.getPassword(), salt, 2).toString();
		user.setPassword(md5pwd);
		um.updatepwd(user);
		return "true";
	}




	@Override
	public void updatenickname(TUserData user) {
		um.updatenickname(user);
	}




	@Override
	public void updateinfo(TUserData user) {
		um.updateinfo(user);
	}

}
