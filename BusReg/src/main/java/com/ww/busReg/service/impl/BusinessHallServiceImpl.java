package com.ww.busReg.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.ww.busReg.dao.BusinessHallDao;
import com.ww.busReg.domain.BusinessHall;
import com.ww.busReg.domain.Suboffice;
import com.ww.busReg.service.BusinessHallService;
import com.ww.busReg.vo.PageResout;
@Service("businessHallService")
public class BusinessHallServiceImpl implements BusinessHallService{
	@Resource
	BusinessHallDao businessHallDao;
	@Override
	public void findForPageToShow(Integer subofficeId,String name, String num, PageResout pageResout) {
		if(!StringUtils.isEmpty(name))
		{
			name=name+"%";
		}
		if(!StringUtils.isEmpty(num))
		{
			num=num+"%";		
		}
		int totalCount= businessHallDao.getFindCount(subofficeId,name,num);
		pageResout.setTotalCount(totalCount);
		List<Map<String, Object>> resout= businessHallDao.findForPageToShow(subofficeId,name,num,pageResout.getStartIndex(),pageResout.getPageSize());
		pageResout.setDatas(resout);
		
	}
	@Override
	public boolean add(int subofficeId, String name, String num) {
		int numCount= businessHallDao.getCountByNum(num);

		if(numCount>0)
		{
			return false;
		}
		else
		{
			BusinessHall businessHall=new BusinessHall();
			businessHall.setName(name);
			businessHall.setNum(num);
			businessHall.setSubofficeId(subofficeId);
			businessHallDao.insert(businessHall);
			return true;
		}
	}
	@Override
	public List<BusinessHall> getBySubofficeId(int subofficeId) {
		return businessHallDao.getBySubofficeId(subofficeId);
	}

}
