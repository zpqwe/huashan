package serviceimpl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import dao.UserInfoMapper;

import entity.TUserData;

import service.UserInfoService;

@Service("UserInfoService")

public class UserInfoServiceImpl implements UserInfoService {

	@Resource
	@Qualifier("userInfoMapper")
	private UserInfoMapper userInfoMapper;
	@Override
	public void saveUserInfo(TUserData tuser) {
		// TODO Auto-generated method stub
		userInfoMapper.saveUser(tuser);
	}
	@Override
	public void updateNickName(TUserData tuser) {
		// TODO Auto-generated method stub
		userInfoMapper.updateNickName(tuser);
	}

}
