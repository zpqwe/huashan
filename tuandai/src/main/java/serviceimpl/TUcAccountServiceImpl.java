package serviceimpl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import query.TUcAccountQuery;

import dao.TSiRecordMapper;
import dao.TUcAccountMapper;

import entity.TUcAccount;
import entity.TUserData;
import service.TUcAccountService;
@Service("tUcAccountService")
public class TUcAccountServiceImpl implements TUcAccountService{
	@Resource
	@Qualifier("TUcAccountMapper")
	private TUcAccountMapper tum;
	public TUcAccount getTUcAccount(TUserData tUserData) {
		
		return tum.getTUcAccount(tUserData);
	}
	@Override
	public void updatermoney(TUcAccountQuery tUcAccountQuery) {
		tum.updatermoney(tUcAccountQuery);
		
	}

}
