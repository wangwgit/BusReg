package com.ww.busReg.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SysUtil {
	/**
	 * 获取上传的文件的前缀 根据身份证号码生成一个文件前缀
	 * 
	 * @param cardNum
	 *            身份证号码
	 * @return 时间_身份证号码_
	 */
	public static String getFilePre(String cardNum) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		return sdf.format(new Date()) + "_" + cardNum + "_";
	}

	/**
	 * 获取文件的后缀名
	 * 
	 * @param fileName
	 *            文件名
	 * @return 文件的后缀名
	 */
	public static String getSuffix(String fileName) {
		int last = fileName.lastIndexOf(".");
		if (last != -1) {
			return fileName.substring(fileName.lastIndexOf("."),
					fileName.length());
		}
		return "";
	}
	/**
	 * 实现文件的下载功能
	 * @param fileName	要下载的文件的名称
	 * @param downName	下载后的默认名称
	 * @param response	
	 */
	public static void downFile(String fileName,String downName, HttpServletResponse response) {
		if (fileName != null) {
			File file = new File( fileName);
			if (file.exists()) {
				response.setContentType("application/force-download");// 设置强制下载不打开
				response.addHeader("Content-Disposition",
						"attachment;fileName=" + downName);// 设置文件名
				byte[] buffer = new byte[1024];
				FileInputStream fis = null;
				BufferedInputStream bis = null;
				try {
					fis = new FileInputStream(file);
					bis = new BufferedInputStream(fis);
					OutputStream os = response.getOutputStream();
					int i = bis.read(buffer);
					while (i != -1) {
						os.write(buffer, 0, i);
						i = bis.read(buffer);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (bis != null) {
						try {
							bis.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
					if (fis != null) {
						try {
							fis.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
	}
}
