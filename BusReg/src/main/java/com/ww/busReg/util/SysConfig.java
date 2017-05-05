package com.ww.busReg.util;

import java.util.ResourceBundle;

public class SysConfig {
	private static final ResourceBundle bundle = ResourceBundle.getBundle("sysConfig");
	public static String filePath()
	{
		return bundle.getString("filePath");
	}
	
}
