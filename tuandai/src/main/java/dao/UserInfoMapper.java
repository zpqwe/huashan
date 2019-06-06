package dao;
import entity.TUserData;

public interface UserInfoMapper {
	
	//保存用户信息
	public void saveUser(TUserData tuser);
	
	//修改昵称
	public void updateNickName(TUserData tuser);
}
