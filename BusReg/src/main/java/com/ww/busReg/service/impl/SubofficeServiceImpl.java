package com.ww.busReg.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.ww.busReg.dao.SubofficeDao;
import com.ww.busReg.domain.Suboffice;
import com.ww.busReg.service.SubofficeService;
import com.ww.busReg.vo.PageResout;

@Service("Suboffice")
public class SubofficeServiceImpl implements SubofficeService{
	@Resource
	SubofficeDao subofficeDao;
	@Override
	public boolean add(String name, String num) {
		int numCount= subofficeDao.getCountByNum(num);

		if(numCount>0)
		{
			return false;
		}
		else
		{
			Suboffice suboffice=new Suboffice();
			suboffice.setName(name);
			suboffice.setNum(num);
			subofficeDao.insert(suboffice);
			return true;
		}
		
	}
	@Override
	public void findForPage(String name, String num, PageResout pageResout) {
		if(!StringUtils.isEmpty(name))
		{
			name=name+"%";
		}
		if(!StringUtils.isEmpty(num))
		{
			num=num+"%";		
		}
		int totalCount= subofficeDao.getFindCount(name,num);
		pageResout.setTotalCount(totalCount);
		List<Suboffice> resout= subofficeDao.findForPage(name,num,pageResout.getStartIndex(),pageResout.getPageSize());
		pageResout.setDatas(resout);
		
	}
	@Override
	public List<Suboffice> getAllUsable() {
		
		return subofficeDao.getAllUsable();
	}

}
