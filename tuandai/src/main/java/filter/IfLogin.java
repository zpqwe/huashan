package filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class IfLogin implements Filter {
	private String uncheckUrls =null;  
	private String userSessionKey=null;  
	private String rediretPage=null; 
	@Override
	public void destroy() {
		
	}
	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		 rediretPage=fConfig.getServletContext().getInitParameter("rediretPage");  
		  uncheckUrls=fConfig.getServletContext().getInitParameter("uncheckUrls");  
	       userSessionKey=fConfig.getServletContext().getInitParameter("userSessionKey");
	}
	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		  //1.得到访问路径  
        HttpServletRequest request = (HttpServletRequest)req;  
        HttpServletResponse response = (HttpServletResponse)res;  
        String reqUrl = request.getRequestURL().toString();
        HttpSession session=request.getSession();
        String reqURI = request.getRequestURI();
        String servletPath = request.getServletPath();
          
      //String[] uncheckUrl = uncheckUrls.split(",");  
        List<String> urls = Arrays.asList(uncheckUrls.split(","));  
        //2.如果是属于不需要过滤的地址就直接  放行  方法结束  
        if(urls.contains(servletPath)|servletPath.contains("/js")|servletPath.contains("/css")|servletPath.contains("/images")){
            chain.doFilter(req, res);  
            return;
        }  
        //3.从session中获取sessionKey对应的值；若不存在  则跳转到登陆页面  
          
        Object user = request.getSession().getAttribute("user");  
        if(user==null){//把获取的url存入到session中
        	session.setAttribute("goUrl", reqURI);
        	//request.getRequestDispatcher("/ulogin.jsp").forward(request, response);
        	/*session.getAttribute(reqUrl);*/
        	/*response.sendRedirect(request.getContextPath()+rediretPage);*/
            request.getRequestDispatcher(rediretPage).forward(req, res); 
            return;
        }else{
        	/*else if(user!=null &&reqUrl!=null){
        }
        	response.sendRedirect(reqUrl);
        	return;
        }*/
        //4若存在 则放行;
        chain.doFilter(req, res);
        }
	}


}
