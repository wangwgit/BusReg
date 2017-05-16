package com.ww.busReg.service;

import com.ww.busReg.vo.PageResout;

public interface BusinessHallService {

	void findForPageToShow(Integer subofficeId, String name, String num, PageResout pageResout);

	boolean add(int subofficeId, String name, String num);

}
