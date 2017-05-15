package com.ww.busReg.service;

import com.ww.busReg.vo.PageResout;

public interface SubofficeService {

	boolean add(String name, String num);

	void findForPage(String name, String num, PageResout pageResout);

}
