package com.ww.busReg.controller;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ww.busReg.service.SubofficeService;
import com.ww.busReg.vo.PageResout;

@Controller
@RequestMapping("/sys/suboffice")
public class SubofficeConteoller {
	@Resource
	SubofficeService subofficeService;
	@RequestMapping("/list")
	public String list(String name,String num,Integer currentPage,HttpServletRequest request)
	{
		PageResout pageResout=new PageResout();
		pageResout.setCurrentPage(currentPage);
		subofficeService.findForPage(name,num,pageResout);
		request.setAttribute("pageResout", pageResout);
		request.setAttribute("name", name);
		request.setAttribute("num", num);
		return "sys/suboffice/list";
	}
	@RequestMapping("/toInput")
	public String toInput()
	{
		return "sys/suboffice/input";
	}
	@RequestMapping("/add")
	public String add(String name,String num,HttpServletRequest request)
	{
		boolean resout= subofficeService.add(name,num);
		if(resout)
		{
			request.setAttribute("backUrl", "sys/suboffice/toInput.do");
			return "util/optSuccess";
		}
		else
		{
			return "util/optFaile";
			
		}
		
	}
}
