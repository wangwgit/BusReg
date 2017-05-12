package com.ww.busReg.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.ww.busReg.dao.UimDao;
import com.ww.busReg.domain.Uim;
import com.ww.busReg.service.UimService;
import com.ww.busReg.vo.PageResout;

@Service("uimService")
public class UimServiceImpl implements UimService{
	@Resource
	UimDao uimDao;

	@Override
	public void add(Uim uim) {
		uimDao.insert(uim);
	}

	@Override
	public void findForPageForShow(String userName, String cardNum,
			PageResout pageResout) {
		if(!StringUtils.isEmpty(userName))
		{
			userName=userName+"%";
		}
		if(!StringUtils.isEmpty(cardNum))
		{
			cardNum=cardNum+"%";		
		}
		int totalCount= uimDao.getFindCount(userName,cardNum);
		pageResout.setTotalCount(totalCount);
		List<Map<String, Object>> resout= uimDao.findForPageForShow(userName,cardNum,pageResout.getStartIndex(),pageResout.getPageSize());
		pageResout.setDatas(resout);

	}

	@Override
	public Map<String, Object> getDetailsByIdForShow(int id) {
		return uimDao.getDetailsByIdForShow(id);
	}

	@Override
	public Uim getById(int id) {
		return uimDao.getById(id);
	}
}
