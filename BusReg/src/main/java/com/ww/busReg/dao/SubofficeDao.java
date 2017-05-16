package com.ww.busReg.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ww.busReg.domain.Suboffice;

public interface SubofficeDao {

	int getCountByNum(@Param("num")String num);

	void insert(Suboffice suboffice);

	int getFindCount(@Param("name")String name,@Param("num") String num);

	List<Suboffice> findForPage(@Param("name")String name, @Param("num")String num,
			@Param("startIndex")int startIndex,@Param("pageSize") int pageSize);

	List<Suboffice> getAllUsable();

}
