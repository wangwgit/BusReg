package com.ww.busReg.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ww.busReg.domain.Uim;


public interface UimDao {

	void insert(Uim uim);

	int getFindCount(@Param("userName")String userName, @Param("cardNum")String cardNum);

	List<Uim> findForPage(@Param("userName")String userName,@Param("cardNum") String cardNum, @Param("startIndex")Integer startIndex ,@Param("pageSize")Integer pageSize);

	Map<String, Object> getDetailsById(@Param("id")int id);



}
