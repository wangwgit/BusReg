package com.ww.busReg.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ww.busReg.dao.UserDao;
import com.ww.busReg.domain.User;
import com.ww.busReg.service.UserService;
@Service("userService")
public class UserServiceImpl implements UserService{
	@Resource
	UserDao userDao;
	@Override
	public int getCountByNameAndPassWord(String userName, String pawwsord) {
		return userDao.getCountByNameAndPassWord(userName,pawwsord);
	
	}


}
