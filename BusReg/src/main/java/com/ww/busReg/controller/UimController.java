package com.ww.busReg.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ww.busReg.domain.Uim;
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
	@RequestMapping("/add")
	public String addUim(Uim uim,@RequestParam MultipartFile cardPhotoFrontF,@RequestParam MultipartFile cardPhotoBackF,@RequestParam MultipartFile userCardVoideoF,@RequestParam MultipartFile userCardPhotoF) throws IllegalStateException, IOException
	{	
		String filePre= SysUtil.getFilePre(uim.getCardNum());
		
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
		return "inputSuccess";
	}
	@RequestMapping("/listDetails")
	public String listDetails(String userName,String cardNum, Integer currentPage,HttpServletRequest request)
	{
		PageResout pageResout=new PageResout();
		pageResout.setCurrentPage(currentPage);
		uimService.findForPage(userName,cardNum,pageResout);
		request.setAttribute("pageResout", pageResout);
		return "listUimDetails";
	}
}