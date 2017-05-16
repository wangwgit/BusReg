package com.ww.busReg.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ww.busReg.domain.User;

public interface UserDao {

	public int getCountByNameAndPassWord(@Param("userName")String userName, @Param("password")String password);
	
}
