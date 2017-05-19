package com.ww.busReg.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ww.busReg.domain.Broadband;

public interface BroadbandDao {
	void insert(Broadband broadband);

	int getFindCount(@Param("userName")String userName, @Param("cardNum")String cardNum,@Param("subofficeId")Integer subofficeId,@Param("businessHallId")Integer businessHallId);

	List<Map<String, Object>> findForPageForShow(@Param("userName")String userName,@Param("cardNum") String cardNum,@Param("subofficeId")Integer subofficeId,@Param("businessHallId")Integer businessHallId, @Param("startIndex")Integer startIndex ,@Param("pageSize")Integer pageSize);

	Map<String, Object> getDetailsByIdForShow(@Param("id")int id);

	Broadband getById(@Param("id")int id);

	void updateDealStateByKey(@Param("id")int id,@Param("dealState")int dealState);
	
	void updateRemarkByKey(@Param("id")int id,@Param("remark")String remark);

	void removeByKey(@Param("id")int id);
}
