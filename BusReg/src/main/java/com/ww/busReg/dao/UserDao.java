package com.ww.busReg.dao;

import org.apache.ibatis.annotations.Param;

public interface UserDao {

	public int getCountByNameAndPassWord(@Param("userName")String userName, @Param("password")String password);

}
