package com.ww.busReg.service;

import java.util.Map;

import com.ww.busReg.domain.Uim;
import com.ww.busReg.vo.PageResout;

public interface UimService {

	void add(Uim uim);

	void findForPageForShow(String userName, String cardNum,
			PageResout pageResout);

	Map<String, Object> getDetailsByIdForShow(int id);

	Uim getById(int id);

}
