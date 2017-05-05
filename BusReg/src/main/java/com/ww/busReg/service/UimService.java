package com.ww.busReg.service;

import com.ww.busReg.domain.Uim;
import com.ww.busReg.vo.PageResout;

public interface UimService {

	void add(Uim uim);

	void findForPage(String userName, String cardNum,
			PageResout pageResout);

}
