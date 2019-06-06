package service;

import entity.TUserData;

public interface UserInfoService {
	public void saveUserInfo(TUserData tuser);
	
	public void updateNickName(TUserData tuser);
}
