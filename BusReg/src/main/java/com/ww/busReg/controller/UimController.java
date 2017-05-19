package com.ww.busReg.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ww.busReg.domain.BusinessHall;
import com.ww.busReg.domain.Suboffice;
import com.ww.busReg.domain.Uim;
import com.ww.busReg.domain.User;
import com.ww.busReg.service.BusinessHallService;
import com.ww.busReg.service.SubofficeService;
import com.ww.busReg.service.UimService;
import com.ww.busReg.util.SysConfig;
import com.ww.busReg.util.SysUtil;
import com.ww.busReg.vo.PageResout;

@Controller
@RequestMapping("/uim")
public class UimController {
	String filePath= SysConfig.filePath()+File.separatorChar;
	@Resource
	UimService uimService;
	@Resource
	SubofficeService subofficeService;
	@Resource
	BusinessHallService businessHallService;
	@RequestMapping("/add")
	public String addUim(Uim uim,@RequestParam MultipartFile cardPhotoFrontF,@RequestParam MultipartFile cardPhotoBackF,@RequestParam MultipartFile userCardVoideoF,@RequestParam MultipartFile userCardPhotoF,HttpServletRequest request,HttpSession session) throws IllegalStateException, IOException
	{	
		User user = (User) session.getAttribute("user");
		String filePre= SysUtil.getFilePre(uim.getCardNum());
		
		uim.setSubofficeId(user.getSubofficeId());
		uim.setBusinessHallId(user.getBusinessHallId());
		uim.setDealState(0);
		
		String fileName=filePre+cardPhotoFrontF.getName()+SysUtil.getSuffix(cardPhotoFrontF.getOriginalFilename());
		cardPhotoFrontF.transferTo(new File(filePath+fileName));
		uim.setCardPhotoFront(fileName);
		
		fileName=filePre+cardPhotoBackF.getName()+SysUtil.getSuffix(cardPhotoBackF.getOriginalFilename());
		cardPhotoBackF.transferTo(new File(filePath+fileName));
		uim.setCardPhotoBack(fileName);
		
		fileName=filePre+userCardVoideoF.getName()+SysUtil.getSuffix(userCardVoideoF.getOriginalFilename());
		userCardVoideoF.transferTo(new File(filePath+fileName));
		uim.setUserCardVoideo(fileName);
		
		fileName=filePre+userCardPhotoF.getName()+SysUtil.getSuffix(userCardPhotoF.getOriginalFilename());
		userCardPhotoF.transferTo(new File(filePath+fileName));
		uim.setUserCardPhoto(fileName);
		
		uimService.add(uim);
		//指定点击确定要跳转的页面
		request.setAttribute("backUrl", "toInput.do");
		return "util/optSuccess";
	}
//	@RequestMapping("/list")
//	public String listDetails(String userName,String cardNum, Integer currentPage,HttpServletRequest request)
//	{
//		List<Suboffice> suboffices= subofficeService.getAllUsable();
//		request.setAttribute("suboffices", suboffices);
//		PageResout pageResout=new PageResout();
//		pageResout.setCurrentPage(currentPage);
//		uimService.findForPageForShow(userName,cardNum,pageResout);
//		request.setAttribute("pageResout", pageResout);
//		request.setAttribute("userName", userName);
//		request.setAttribute("cardNum", cardNum);
//	//	return "workBill/uim/list3";
//		return "workBill/uim/list1";
//	}
	@RequestMapping("/list")
	public String listDetails(String userName,String cardNum,Integer subofficeId,Integer businessHallId, Integer currentPage,HttpServletRequest request,HttpSession session)
	{
		request.setAttribute("subofficeId", subofficeId);
		request.setAttribute("businessHallId", businessHallId);	
		request.setAttribute("userName", userName);
		request.setAttribute("cardNum", cardNum);
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
		uimService.findForPageForShow(userName,cardNum,user.getSubofficeId(),user.getBusinessHallId(),pageResout);
		request.setAttribute("pageResout", pageResout);
		return "workBill/uim/list3";
	}
	private String 	list1(String userName,String cardNum,Integer subofficeId,Integer businessHallId, Integer currentPage,HttpServletRequest request)
	{
		List<Suboffice> suboffices= subofficeService.getAllUsable();
		request.setAttribute("suboffices", suboffices);
		PageResout pageResout=new PageResout();
		pageResout.setCurrentPage(currentPage);
		uimService.findForPageForShow(userName,cardNum,subofficeId,businessHallId,pageResout);
		request.setAttribute("pageResout", pageResout);
		return "workBill/uim/list1";
	}
	private String 	list2(String userName,String cardNum,Integer businessHallId, Integer currentPage,HttpServletRequest request,User user)
	{
		List<BusinessHall> businessHalls= businessHallService.getBySubofficeId(1);
		request.setAttribute("businessHalls", businessHalls);
		PageResout pageResout=new PageResout();
		pageResout.setCurrentPage(currentPage);
		uimService.findForPageForShow(userName,cardNum,user.getSubofficeId(),businessHallId,pageResout);
		request.setAttribute("pageResout", pageResout);
		return "workBill/uim/list2";
	}
	@RequestMapping("/details")
	public String details(int id,HttpServletRequest request,HttpSession session)
	{
		Map<String, Object> uim=  uimService.getDetailsByIdForShow(id);
		request.setAttribute("uim", uim);
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
		return "workBill/uim/details";
	}
	@RequestMapping("/delete")	
	public String delete(int id,HttpServletRequest request,HttpSession session)
	{
		User user = (User) session.getAttribute("user");
		if(user.getLimitsId()!=1)
		{
			return "";
		}
		uimService.remove(id);
		request.setAttribute("backUrl", "uim/list.do");
		return "util/optSuccess";
	}
	@RequestMapping("/changeDealState")	
	public String changeDealState(int id,int dealState,HttpServletRequest request,HttpSession session)
	{
		Uim uim =uimService.getById(id);
		if(!isHaveLimits(uim,session))
		{
			return"";
		}
		uimService.changeDealState(id,dealState);
		request.setAttribute("backUrl", "uim/list.do");
		return "util/optSuccess";
	}
	@RequestMapping("/toRemark")	
	public String toRemark(int id,HttpServletRequest request)
	{
		Uim uim=uimService.getById(id);
		request.setAttribute("uim", uim);
		return "workBill/uim/remark";
	}
	@RequestMapping("/changeRemark")	
	public String changeRemark(int id,String remark,HttpServletRequest request)
	{
		uimService.changeRemark(id,remark);
		request.setAttribute("backUrl", "uim/list.do");
		return "util/optSuccess";
	}	
	@RequestMapping("/downFile")
	public void downFile(int id,String type,HttpServletResponse response,HttpSession session)
	{
		Uim uim= uimService.getById(id);
		if(!isHaveLimits(uim,session))
		{
			return;
		}
		if(uim!=null)
		{
			String fileName;
			String downName;
			switch (type) {
			case "cardPhotoFront":
				fileName=uim.getCardPhotoFront();
				break;
			case "cardPhotoBack":
				fileName=uim.getCardPhotoBack();
				break;
			case "userCardVoideo":
				fileName=uim.getUserCardVoideo();
				break;
			case "userCardPhoto":
				fileName=uim.getUserCardPhoto();
				break;
			default:
				fileName="";
				break;
			}
			downName=fileName.substring(fileName.indexOf("_")+1);
			SysUtil.downFile(filePath+fileName,downName, response);
		}
	}
	private boolean isHaveLimits(Uim uim,HttpSession session)
	{
		User user = (User) session.getAttribute("user");
		if(user.getLimitsId()==2)
		{
			if(uim.getSubofficeId()!=user.getSubofficeId())
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
