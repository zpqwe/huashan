package realm;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import entity.TUserData;

import service.UserService;

public class UserRealm extends AuthorizingRealm {
	
	@Autowired
	private UserService us;

	private SimpleAuthenticationInfo info = null;

	
	@Override
	//用户授权
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		return null;
	}

	@Override
	//用于认证
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken usernamePasswordToken=(UsernamePasswordToken) token;
		String userName= usernamePasswordToken.getUsername();
		TUserData user= us.getUser(userName);
		if(user!=null){
            ByteSource salt = ByteSource.Util.bytes(userName);
            String realmName = this.getName();
            info = new SimpleAuthenticationInfo(user.getPhone(), user.getPassword(), salt,realmName);
            Subject currentUser = SecurityUtils.getSubject();
            Session session = currentUser.getSession();
            session.setAttribute("user",user);
		}
        return info;
	}

}
