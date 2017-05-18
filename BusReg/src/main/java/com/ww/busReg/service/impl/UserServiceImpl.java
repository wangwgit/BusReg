package com.ww.busReg.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.ww.busReg.dao.UserDao;
import com.ww.busReg.domain.User;
import com.ww.busReg.service.UserService;
import com.ww.busReg.vo.PageResout;
@Service("userService")
public class UserServiceImpl implements UserService{
	@Resource
	UserDao userDao;
	@Override
	public int getCountByNameAndPassWord(String userName, String pawwsord) {
		return userDao.getCountByNameAndPassWord(userName,pawwsord);
	
	}
	@Override
	public boolean add(User user) {
		int count= userDao.getCountByUserName(user.getUserName());
		if(count>0)
		{
			return false;
		}
		userDao.insert(user);
		return true;
	}
	@Override
	public void findforPageToShow(String userName,
			Integer limitsId, Integer subofficeId, Integer businessHallId,
			PageResout pageResout) {
		if(!StringUtils.isEmpty(userName))
		{
			userName=userName+"%";
		}
		int totalCount= userDao.getFindCount(userName,limitsId,subofficeId,businessHallId);
		pageResout.setTotalCount(totalCount);
		List<Map<String, Object>> resout= userDao.findforPageToShow(userName,limitsId,subofficeId,businessHallId,pageResout.getStartIndex(),pageResout.getPageSize());
		pageResout.setDatas(resout);
		
	}


}
