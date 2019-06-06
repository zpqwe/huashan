package service;

import java.util.List;



import entity.TUcAccount;
import entity.TUserData;

public interface UserService {
	public void addUser(String phone,String passWord);
	
	public TUserData getUser(String phone);
	
	public TUserData getNewUser(String phone);

	public void addUserId(TUcAccount account);
	
	public Boolean checkUser(String phone,String passWord);
	
	public void saveVerCode(String phone) ;
	
	public Boolean getSMS(String phone,Integer verCode);
	
	public String updatepwd(TUserData user);
	
	public void updatenickname(TUserData user);
	
	public void updateinfo(TUserData user);
	
}
