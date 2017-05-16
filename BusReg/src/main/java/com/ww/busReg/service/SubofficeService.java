package com.ww.busReg.service;

import java.util.List;

import com.ww.busReg.domain.Suboffice;
import com.ww.busReg.vo.PageResout;

public interface SubofficeService {

	boolean add(String name, String num);

	void findForPage(String name, String num, PageResout pageResout);

	List<Suboffice> getAllUsable();

}
