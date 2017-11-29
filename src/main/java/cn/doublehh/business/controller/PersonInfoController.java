package cn.doublehh.business.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublehh.system.model.User;
import cn.doublehh.system.model.vo.Result;
import cn.doublehh.system.service.UserService;

@Controller
@RequestMapping("/personInfo")
public class PersonInfoController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/getPersonInfo")
	@ResponseBody
	public User getPersonInfo(HttpSession session){
		
		User user = (User) session.getAttribute("user");
		return user;
	}
	
	/**
	 * 更新收货信息 返回1成功0失败
	 * @param user
	 * @return
	 */
	@RequestMapping("/updatePersonInfo")
	@ResponseBody
	public int updatePersonInfo(User user,HttpSession session){
		
		User user2 = (User) session.getAttribute("user");
		if(user2==null){
			return -1;
		}
		user.setUid(user2.getUid());
		if(userService.updatePersonInfo(user)>0){
			session.setAttribute("user", userService.getUserByUid(user2.getUid()));
			return 1;
		}
		
		return 0;
	}
	
	@RequestMapping("/getUserInfo")
	@ResponseBody
	public User getUserInfo(HttpSession session){
		
		User user = (User) session.getAttribute("user");
		return user;
	}
}
