package com.ww.busReg.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ww.busReg.domain.Limits;
import com.ww.busReg.domain.Suboffice;
import com.ww.busReg.domain.User;
import com.ww.busReg.service.LimitsService;
import com.ww.busReg.service.SubofficeService;
import com.ww.busReg.service.UserService;
import com.ww.busReg.vo.PageResout;

@Controller
@RequestMapping("/sys/user")
public class UserConteoller {
	@Resource
	LimitsService limitsService;
	@Resource
	SubofficeService subofficeService;
	@Resource
	UserService userServices;
	@RequestMapping("/list")
	public String list(String userName,Integer limitsId,Integer subofficeId,Integer businessHallId,Integer currentPage,HttpServletRequest request)
	{
		List<Limits> limitss= limitsService.getAll();
		request.setAttribute("limitss", limitss);
		List<Suboffice> suboffices= subofficeService.getAllUsable();
		request.setAttribute("suboffices", suboffices);
		request.setAttribute("limitsId", limitsId);
		request.setAttribute("subofficeId", subofficeId);
		request.setAttribute("businessHallId", businessHallId);
		PageResout pageResout=new PageResout();
		pageResout.setCurrentPage(currentPage);
		userServices.findforPageToShow(userName,limitsId,subofficeId,businessHallId,pageResout);
		request.setAttribute("pageResout", pageResout);
		request.setAttribute("userName", userName);
		return "sys/user/list";
	}
	@RequestMapping("/toInput")
	public String toInput(HttpServletRequest request)
	{
		List<Limits> limitss= limitsService.getAll();
		request.setAttribute("limitss", limitss);
		List<Suboffice> suboffices= subofficeService.getAllUsable();
		request.setAttribute("suboffices", suboffices);
		return "sys/user/input";
	}
	@RequestMapping("/add")
	public String add(User user,HttpServletRequest request)
	{
		user.setUsable(true);
		boolean resout= userServices.add(user);
		if(resout)
		{
			request.setAttribute("backUrl", "sys/user/toInput.do");
			return "util/optSuccess";
		}
		else
		{
			return "util/optFaile";
			
		}
	}
	
}
