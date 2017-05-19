package com.ww.busReg.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.ww.busReg.dao.BroadbandDao;
import com.ww.busReg.domain.Broadband;
import com.ww.busReg.service.BroadbandService;
import com.ww.busReg.vo.PageResout;

@Service("broadbandService")
public class BroadbandServiceImpl implements BroadbandService{
	@Resource
	BroadbandDao broadbandDao;
	@Override
	public void add(Broadband broadband) {
		broadbandDao.insert(broadband);
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
		int totalCount= broadbandDao.getFindCount(userName,cardNum,subofficeId,businessHallId);
		pageResout.setTotalCount(totalCount);
		List<Map<String, Object>> resout= broadbandDao.findForPageForShow(userName,cardNum,subofficeId,businessHallId,pageResout.getStartIndex(),pageResout.getPageSize());
		pageResout.setDatas(resout);

	}

	@Override
	public Map<String, Object> getDetailsByIdForShow(int id) {
		return broadbandDao.getDetailsByIdForShow(id);
	}

	@Override
	public Broadband getById(int id) {
		return broadbandDao.getById(id);
	}

	@Override
	public void remove(int id) {
		broadbandDao.removeByKey(id);
		
	}

	@Override
	public void changeDealState(int id, int dealState) {
		broadbandDao.updateDealStateByKey(id,dealState);
		
	}

	@Override
	public void changeRemark(int id, String remark) {
		broadbandDao.updateRemarkByKey(id,remark);	
	}
}
