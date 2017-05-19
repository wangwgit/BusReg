package com.ww.busReg.interceptor;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{


//	protected void doFilterInternal(HttpServletRequest request,
//			HttpServletResponse arg1, FilterChain arg2)
//			throws ServletException, IOException {
//
////		system
////		Object obj= request.getSession().getAttribute("user");
////		if(obj==null)
////		{
////			request.getRequestDispatcher("errorPage.do").forward(request, arg1);
////		}
//	}

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
	
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {		
		String[] notFilter = new String[] {"/BusReg/", "/BusReg/toLogin.do", "/BusReg/login.do","/BusReg/errorPage.do" };
		String uri = request.getRequestURI();
		boolean needLogin=true;
		for(String temp:notFilter)
		{
			if(uri.equals(temp))
			{
				needLogin=false;
			}
		}
		if(needLogin)
		{
			Object obj= request.getSession().getAttribute("user");
			if(obj==null)
			{
		
				response.sendRedirect("/BusReg/errorPage.do");
				return false;
			}		
		}

		return true;
	}

}
