package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class SetFilter implements Filter {
	@Override
	public void destroy() {
		
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
			//设置编码
			request.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			chain.doFilter(request, response);
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}
}
