package com.ww.busReg.service;

import java.util.Map;

import com.ww.busReg.domain.Broadband;
import com.ww.busReg.vo.PageResout;

public interface BroadbandService {
	void add(Broadband broadband);

	void findForPageForShow(String userName, String cardNum,Integer subofficeId,Integer businessHallId,
			PageResout pageResout);

	Map<String, Object> getDetailsByIdForShow(int id);

	Broadband getById(int id);

	void remove(int id);

	void changeDealState(int id, int dealState);

	void changeRemark(int id, String remark);
}
