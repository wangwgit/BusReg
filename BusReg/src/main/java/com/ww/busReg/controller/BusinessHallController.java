package com.ww.busReg.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ww.busReg.domain.BusinessHall;
import com.ww.busReg.domain.Suboffice;
import com.ww.busReg.service.BusinessHallService;
import com.ww.busReg.service.SubofficeService;
import com.ww.busReg.vo.JsonResout;
import com.ww.busReg.vo.PageResout;

@Controller
@RequestMapping("/sys/businessHall")
public class BusinessHallController {
	@Resource
	BusinessHallService businessHallService;
	@Resource
	SubofficeService subofficeService;
	@RequestMapping("/list")
	public String list(Integer subofficeId,String name,String num,Integer currentPage,HttpServletRequest request)
	{
		if(subofficeId!=null&&0==subofficeId)
		{
			subofficeId=null;
		}
		List<Suboffice> suboffices= subofficeService.getAllUsable();
		PageResout pageResout=new PageResout();
		pageResout.setCurrentPage(currentPage);
		businessHallService.findForPageToShow(subofficeId,name,num,pageResout);
		
		request.setAttribute("pageResout", pageResout);
		request.setAttribute("suboffices", suboffices);
		request.setAttribute("subofficeId", subofficeId);
		request.setAttribute("name", name);
		request.setAttribute("num", num);
		return "sys/businessHall/list";
	}
	@RequestMapping("/toInput")
	public String toInput(HttpServletRequest request)
	{
		List<Suboffice> suboffices= subofficeService.getAllUsable();
		request.setAttribute("suboffices", suboffices);
		return "sys/businessHall/input";
	}
	@RequestMapping("/add")
	public String add(int subofficeId, String name,String num,HttpServletRequest request)
	{
		boolean resout= businessHallService.add(subofficeId,name,num);
		if(resout)
		{
			request.setAttribute("backUrl", "sys/businessHall/toInput.do");
			return "util/optSuccess";
		}
		else
		{
			return "util/optFaile";
			
		}
		
	}
	@ResponseBody 
	@RequestMapping("/getBySubofficeId")
	public JsonResout getBySubofficeId(int subofficeId)
	{
		List<BusinessHall> businessHalls= businessHallService.getBySubofficeId(subofficeId);
		JsonResout jsonResout=new JsonResout();
		jsonResout.setSuccess(true);
		jsonResout.setData(businessHalls);
		return jsonResout;
	}
}
