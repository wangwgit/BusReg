package com.ww.busReg.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ww.busReg.dao.LimitsDao;
import com.ww.busReg.domain.Limits;
import com.ww.busReg.service.LimitsService;
@Service("limitsService")
public class LimitsServiceImpl implements LimitsService{
	@Resource
	LimitsDao limitsDao;
	@Override
	public List<Limits> getAll() {
		return limitsDao.getAll();
	}

}
