package com.ww.busReg.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ww.busReg.domain.Suboffice;

@Controller
@RequestMapping("/sys/user")
public class UserConteoller {
	@RequestMapping("/list")
	public String list()
	{
		return "sys/user/list";
	}
	@RequestMapping("/toInput")
	public String toInput(HttpServletRequest request)
	{

		return "sys/businessHall/input";
	}
	@RequestMapping("/add")
	public String add()
	{
		return "";
	}
	
}
