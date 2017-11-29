package cn.doublehh.business.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublehh.business.utils.WebUtils;
import cn.doublehh.system.model.User;
import cn.doublehh.system.service.UserService;

@Controller
@RequestMapping("/personCenter")
public class PersonCenter {

	@Autowired
	private UserService userService;
	
	/**
	 * 验证旧密码 1正确0错误  
	 * @param password
	 * @param session
	 * @return
	 */
	@RequestMapping("/checkOldPassword")
	@ResponseBody
	public int checkOldPassword(String password,HttpSession session){
		
		User user = (User) session.getAttribute("user");
		String uid = user.getUid();
		if(userService.checkOldPassword(uid, password)!=null){
			session.setAttribute("allowUpdatePassword", "1");
			return 1;
		}
		session.setAttribute("allowUpdatePassword", "1");
		return 0;
	}
	
	/**
	 * 更新密码 1成功0失败
	 * @param password
	 * @param session
	 * @return
	 */
	@RequestMapping("/updatePassword")
	@ResponseBody
	public int updatePassword(String password,HttpSession session){
		
		String allowUpdatePassword = (String) session.getAttribute("allowUpdatePassword");
		if(!"1".equals(allowUpdatePassword)){
			return 0;
		}
		User user = (User) session.getAttribute("user");
		return userService.updatePassword(user.getUid(), password);
	}
}
