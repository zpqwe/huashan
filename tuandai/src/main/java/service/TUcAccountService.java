package service;

import query.TUcAccountQuery;
import entity.TUcAccount;
import entity.TUserData;

public interface TUcAccountService {
	public TUcAccount getTUcAccount(TUserData tUserData);
	public void updatermoney(TUcAccountQuery tUcAccountQuery);
}
