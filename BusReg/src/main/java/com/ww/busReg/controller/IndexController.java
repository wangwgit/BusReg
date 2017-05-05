package com.ww.busReg.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.ww.busReg.service.UserService;
import com.ww.busReg.vo.JsonResout;

@Controller
@RequestMapping("/")
public class IndexController {
	@Resource
	UserService userService;
	@RequestMapping("/index")
	public String toIndex() {
		return "input";
	}
	@RequestMapping("/toLogin")
	public String toLogin() {
		return "login";
	}
	@RequestMapping("/toList")
	public String toList() {
		return "list";
	}
	@ResponseBody 
	@RequestMapping("/login")
	public JsonResout login(String userName,String password)
	{
		int count= userService.getCountByNameAndPassWord(userName,password);
		Map<String,Object> resoutMap=new HashMap();
		if(count==1)
		{
			resoutMap.put("loginResout",true);
		}
		else 
		{
			resoutMap.put("loginResout",false);
		}
		JsonResout jsonResout=new JsonResout();
		jsonResout.setSuccess(true);
		jsonResout.setData(resoutMap);
		return jsonResout;
	}
}
