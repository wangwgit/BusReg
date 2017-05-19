package com.ww.busReg.service;

import java.util.List;
import java.util.Map;

import com.ww.busReg.domain.User;
import com.ww.busReg.vo.PageResout;

public interface UserService {

	int getCountByNameAndPassWord(String userName, String pawwsord);

	boolean add(User user);

	void findforPageToShow(String userName,
			Integer limitsId, Integer subofficeId, Integer businessHallId,
			PageResout pageResout);

	User getByUserName(String userName);



}
