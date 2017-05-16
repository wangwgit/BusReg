package com.ww.busReg.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ww.busReg.domain.BusinessHall;
import com.ww.busReg.domain.Suboffice;

public interface BusinessHallDao {

	int getFindCount(@Param("subofficeId") Integer subofficeId,
			@Param("name") String name, @Param("num") String num);

	List<Map<String, Object>> findForPageToShow(
			@Param("subofficeId") Integer subofficeId,
			@Param("name") String name, @Param("num") String num,
			@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);

	int getCountByNum(@Param("num") String num);

	void insert(BusinessHall businessHall);

}
