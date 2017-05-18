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
	public void findForPageForShow(String userName, String cardNum,Integer subofficeId,Integer businessHallId,
			PageResout pageResout) {
		if(!StringUtils.isEmpty(userName))
		{
			userName=userName+"%";
		}
		if(!StringUtils.isEmpty(cardNum))
		{
			cardNum=cardNum+"%";		
		}
		int totalCount= uimDao.getFindCount(userName,cardNum,subofficeId,businessHallId);
		pageResout.setTotalCount(totalCount);
		List<Map<String, Object>> resout= uimDao.findForPageForShow(userName,cardNum,subofficeId,businessHallId,pageResout.getStartIndex(),pageResout.getPageSize());
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

	@Override
	public void remove(int id) {
		uimDao.removeByKey(id);
		
	}

	@Override
	public void changeDealState(int id, int dealState) {
		uimDao.updateDealStateByKey(id,dealState);
		
	}

	@Override
	public void changeRemark(int id, String remark) {
		uimDao.updateRemarkByKey(id,remark);	
	}
}
