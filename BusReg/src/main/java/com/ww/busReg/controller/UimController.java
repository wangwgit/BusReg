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

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ww.busReg.domain.Suboffice;
import com.ww.busReg.domain.Uim;
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
	@RequestMapping("/add")
	public String addUim(Uim uim,@RequestParam MultipartFile cardPhotoFrontF,@RequestParam MultipartFile cardPhotoBackF,@RequestParam MultipartFile userCardVoideoF,@RequestParam MultipartFile userCardPhotoF,HttpServletRequest request) throws IllegalStateException, IOException
	{	
		String filePre= SysUtil.getFilePre(uim.getCardNum());
		
		uim.setSubofficeId(0);
		uim.setBusinessHallId(0);
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
	public String listDetails(String userName,String cardNum,Integer subofficeId,Integer businessHallId, Integer currentPage,HttpServletRequest request)
	{
		List<Suboffice> suboffices= subofficeService.getAllUsable();
		request.setAttribute("suboffices", suboffices);
		request.setAttribute("subofficeId", subofficeId);
		request.setAttribute("businessHallId", businessHallId);
		PageResout pageResout=new PageResout();
		pageResout.setCurrentPage(currentPage);
		uimService.findForPageForShow(userName,cardNum,subofficeId,businessHallId,pageResout);
		request.setAttribute("pageResout", pageResout);
		request.setAttribute("userName", userName);
		request.setAttribute("cardNum", cardNum);
	//	return "workBill/uim/list3";
		return "workBill/uim/list1";
	}
	@RequestMapping("/details")
	public String details(int id,HttpServletRequest request)
	{
		Map<String, Object> uim=  uimService.getDetailsByIdForShow(id);
		request.setAttribute("uim", uim);
		request.setAttribute("canChangeDealState", true);
		request.setAttribute("canDelete", true);
		request.setAttribute("canRemark", true);
		return "workBill/uim/details";
	}
	@RequestMapping("/delete")	
	public String delete(int id,HttpServletRequest request)
	{
		uimService.remove(id);
		request.setAttribute("backUrl", "uim/list.do");
		return "util/optSuccess";
	}
	@RequestMapping("/changeDealState")	
	public String changeDealState(int id,int dealState,HttpServletRequest request)
	{
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
	public void downFile(int id,String type,HttpServletResponse response)
	{
		Uim uim= uimService.getById(id);
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
}
