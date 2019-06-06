package dao;

import query.TUcAccountQuery;
import entity.TUcAccount;
import entity.TUserData;

public interface TUcAccountMapper {
	public TUcAccount getTUcAccount(TUserData tUserData);
	public void updatermoney(TUcAccountQuery tUcAccountQuery);
	}

 