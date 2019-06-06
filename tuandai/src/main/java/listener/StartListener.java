package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import util.Constants;

/**
 * @description 题目
 * @author xxx
 * @time 2018-12-10上午10:47:43
 */
public class StartListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("*******contextInitialized*******");
		sce.getServletContext().setAttribute("IMG_SERVER_NAME", Constants.IMG_SERVER_NAME);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}

	

}
