package dao;

import java.util.List;

import entity.TUcAccount;
import entity.TUserData;

public interface UserMapper {
	
	public void addUser(TUserData user);
	
	public TUserData getUser(String phone);
	
	public TUserData getNewUser(String phone);
	
	public void addUserId(TUcAccount account);
	
	public void updatepwd(TUserData user);
	
	public void updatenickname(TUserData user);
	
	public void updateinfo(TUserData user);
	
}
