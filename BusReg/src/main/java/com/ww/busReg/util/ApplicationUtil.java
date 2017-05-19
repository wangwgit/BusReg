package com.ww.busReg.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

/**
 * 任何位置可以通过本类获取spring中的类实例
 * @date 2016年9月7日 上午11:36:16
 *
 */
@Service("applicationUtil")
public class ApplicationUtil implements ApplicationContextAware{
	private static ApplicationContext applicationContext;  
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		ApplicationUtil.applicationContext=applicationContext;
	}
	/**
	 * 通过类名获取类实例
	 * @param name
	 * @return
	 */
	public static Object getBean(String name)
	{
		return applicationContext.getBean(name);	
	}
	/**
	 * 通过类型得到spring容器中的实例
	 * @param cls
	 * @return
	 */
	public static Object getBean(Class cls)
	{
		return applicationContext.getBean(cls);
	}
	
}
