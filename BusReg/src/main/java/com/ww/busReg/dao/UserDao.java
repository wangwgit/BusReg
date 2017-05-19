package com.ww.busReg.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ww.busReg.domain.User;
import com.ww.busReg.vo.PageResout;

public interface UserDao {

	public int getCountByNameAndPassWord(@Param("userName") String userName,
			@Param("password") String password);

	public int getCountByUserName(@Param("userName") String userName);

	public void insert(User user);

	public List<Map<String, Object>> findforPageToShow(
			@Param("userName") String userName,
			@Param("limitsId") Integer limitsId,
			@Param("subofficeId") Integer subofficeId,
			@Param("businessHallId") Integer businessHallId,
			@Param("startIndex") Integer startIndex,
			@Param("pageSize") Integer pageSize);

	public int getFindCount(@Param("userName") String userName,
			@Param("limitsId") Integer limitsId,
			@Param("subofficeId") Integer subofficeId,
			@Param("businessHallId") Integer businessHallId);

	public User getByName(@Param("userName") String userName);

}
