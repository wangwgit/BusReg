package com.ww.busReg.service;

import java.util.List;

import com.ww.busReg.domain.BusinessHall;
import com.ww.busReg.vo.PageResout;

public interface BusinessHallService {

	void findForPageToShow(Integer subofficeId, String name, String num, PageResout pageResout);

	boolean add(int subofficeId, String name, String num);

	List<BusinessHall> getBySubofficeId(int subofficeId);

}
