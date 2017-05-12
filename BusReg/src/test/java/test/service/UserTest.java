package test.service;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ww.busReg.domain.User;
import com.ww.busReg.service.UserService;



@RunWith(SpringJUnit4ClassRunner.class)	
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class UserTest {
	@Resource
	UserService userService;
	@Test
	public void test()
	{
		List<User> users= userService.getAll();
		System.out.println(users);
	}
}
