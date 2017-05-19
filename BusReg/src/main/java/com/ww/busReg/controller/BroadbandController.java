package com.ww.busReg.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ww.busReg.domain.Broadband;
import com.ww.busReg.domain.BusinessHall;
import com.ww.busReg.domain.Suboffice;
import com.ww.busReg.domain.User;
import com.ww.busReg.service.BusinessHallService;
import com.ww.busReg.service.SubofficeService;
import com.ww.busReg.service.BroadbandService;
import com.ww.busReg.util.SysConfig;
import com.ww.busReg.util.SysUtil;
import com.ww.busReg.vo.PageResout;

@Controller
@RequestMapping("/broadband")
public class BroadbandController {
	String filePath= SysConfig.filePath()+File.separatorChar;
	@Resource
	BroadbandService broadbandService;
	@Resource
	SubofficeService subofficeService;
	@Resource
	BusinessHallService businessHallService;
	@RequestMapping("/add")
	public String addBroadband(Broadband broadband,@RequestParam MultipartFile cardPhotoFrontF,@RequestParam MultipartFile cardPhotoBackF,HttpServletRequest request,HttpSession session) throws IllegalStateException, IOException
	{	
		User user = (User) session.getAttribute("user");
		String filePre= SysUtil.getFilePre(broadband.getCardNum());
		
		broadband.setSubofficeId(user.getSubofficeId());
		broadband.setBusinessHallId(user.getBusinessHallId());
		broadband.setDealState(0);
		
		String fileName=filePre+cardPhotoFrontF.getName()+SysUtil.getSuffix(cardPhotoFrontF.getOriginalFilename());
		cardPhotoFrontF.transferTo(new File(filePath+fileName));
		broadband.setCardPhotoFront(fileName);
		
		fileName=filePre+cardPhotoBackF.getName()+SysUtil.getSuffix(cardPhotoBackF.getOriginalFilename());
		cardPhotoBackF.transferTo(new File(filePath+fileName));
		broadband.setCardPhotoBack(fileName);
		

		
		broadbandService.add(broadband);
		//指定点击确定要跳转的页面
		request.setAttribute("backUrl", "toInput.do");
		return "util/optSuccess";
	}

	@RequestMapping("/list")
	public String listDetails(String userName,String cardNum,Integer subofficeId,Integer businessHallId, Integer currentPage,HttpServletRequest request,HttpSession session)
	{
		request.setAttribute("subofficeId", subofficeId);
		request.setAttribute("businessHallId", businessHallId);	
		request.setAttribute("userName", userName);
		request.setAttribute("cardNum", cardNum);
		request.setAttribute("type", "broadband");
		User user = (User) session.getAttribute("user");
		switch (user.getLimitsId()) {
		case 1:
			return list1(userName,cardNum,subofficeId,businessHallId,currentPage,request);				
		case 2:
			return list2(userName,cardNum,businessHallId,currentPage,request,user);			
		case 3:
			return list3(userName,cardNum,currentPage,request,user);
		default:
			break;
		}
		return "";
	}
	private String list3(String userName, String cardNum, Integer currentPage,
			HttpServletRequest request, User user) {
		PageResout pageResout=new PageResout();
		pageResout.setCurrentPage(currentPage);
		broadbandService.findForPageForShow(userName,cardNum,user.getSubofficeId(),user.getBusinessHallId(),pageResout);
		request.setAttribute("pageResout", pageResout);
		return "workBill/broadband/list3";
	}
	private String 	list1(String userName,String cardNum,Integer subofficeId,Integer businessHallId, Integer currentPage,HttpServletRequest request)
	{
		List<Suboffice> suboffices= subofficeService.getAllUsable();
		request.setAttribute("suboffices", suboffices);
		PageResout pageResout=new PageResout();
		pageResout.setCurrentPage(currentPage);
		broadbandService.findForPageForShow(userName,cardNum,subofficeId,businessHallId,pageResout);
		request.setAttribute("pageResout", pageResout);
		return "workBill/broadband/list1";
	}
	private String 	list2(String userName,String cardNum,Integer businessHallId, Integer currentPage,HttpServletRequest request,User user)
	{
		List<BusinessHall> businessHalls= businessHallService.getBySubofficeId(1);
		request.setAttribute("businessHalls", businessHalls);
		PageResout pageResout=new PageResout();
		pageResout.setCurrentPage(currentPage);
		broadbandService.findForPageForShow(userName,cardNum,user.getSubofficeId(),businessHallId,pageResout);
		request.setAttribute("pageResout", pageResout);
		return "workBill/broadband/list2";
	}
	@RequestMapping("/details")
	public String details(int id,HttpServletRequest request,HttpSession session)
	{
		Map<String, Object> broadband=  broadbandService.getDetailsByIdForShow(id);
		request.setAttribute("broadband", broadband);
		User user = (User) session.getAttribute("user");
		switch (user.getLimitsId()) {
		case 1:
			request.setAttribute("canChangeDealState", true);
			request.setAttribute("canDelete", true);
			request.setAttribute("canRemark", true);
			break;
		case 2:
			request.setAttribute("canChangeDealState", true);
			request.setAttribute("canDelete", true);
			break;

		default:			
		}
		return "workBill/broadband/details";
	}
	@RequestMapping("/delete")	
	public String delete(int id,HttpServletRequest request,HttpSession session)
	{
		User user = (User) session.getAttribute("user");
		if(user.getLimitsId()!=1)
		{
			return "";
		}
		broadbandService.remove(id);
		request.setAttribute("backUrl", "broadband/list.do");
		return "util/optSuccess";
	}
	@RequestMapping("/changeDealState")	
	public String changeDealState(int id,int dealState,HttpServletRequest request,HttpSession session)
	{
		Broadband broadband =broadbandService.getById(id);
		if(!isHaveLimits(broadband,session))
		{
			return"";
		}
		broadbandService.changeDealState(id,dealState);
		request.setAttribute("backUrl", "broadband/list.do");
		return "util/optSuccess";
	}
	@RequestMapping("/toRemark")	
	public String toRemark(int id,HttpServletRequest request)
	{
		Broadband broadband=broadbandService.getById(id);
		request.setAttribute("broadband", broadband);
		return "workBill/broadband/remark";
	}
	@RequestMapping("/changeRemark")	
	public String changeRemark(int id,String remark,HttpServletRequest request)
	{
		broadbandService.changeRemark(id,remark);
		request.setAttribute("backUrl", "broadband/list.do");
		return "util/optSuccess";
	}	
	@RequestMapping("/downFile")
	public void downFile(int id,String type,HttpServletResponse response,HttpSession session)
	{
		Broadband broadband= broadbandService.getById(id);
		if(!isHaveLimits(broadband,session))
		{
			return;
		}
		if(broadband!=null)
		{
			String fileName;
			String downName;
			switch (type) {
			case "cardPhotoFront":
				fileName=broadband.getCardPhotoFront();
				break;
			case "cardPhotoBack":
				fileName=broadband.getCardPhotoBack();
				break;			
			default:
				fileName="";
				break;
			}
			downName=fileName.substring(fileName.indexOf("_")+1);
			SysUtil.downFile(filePath+fileName,downName, response);
		}
	}
	private boolean isHaveLimits(Broadband broadband,HttpSession session)
	{
		User user = (User) session.getAttribute("user");
		if(user.getLimitsId()==2)
		{
			if(broadband.getSubofficeId()!=user.getSubofficeId())
			{
				return false;
			}
		}
		else if(user.getLimitsId()==3)
		{
			if(user.getBusinessHallId()!=user.getBusinessHallId())
			{
				return false;
			}
		}
		return true;
	}
}
