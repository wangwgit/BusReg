package com.ww.busReg.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class SysUtil {
	/**
	 * 获取上传的文件的前缀
	 * 根据身份证号码生成一个文件前缀
	 * @param cardNum 身份证号码
	 * @return 时间_身份证号码_
	 */
	public static String getFilePre(String cardNum)
	{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		return sdf.format(new Date())+"_"+cardNum+"_";
	}
	/**
	 * 获取文件的后缀名
	 * @param fileName	文件名
	 * @return	文件的后缀名
	 */
	public static String getSuffix(String fileName)
	{
		int last=fileName.lastIndexOf(".");
		if(last!=-1)
		{
			return fileName.substring(fileName.lastIndexOf("."),fileName.length());
		}
		return "";	
	}
}	
