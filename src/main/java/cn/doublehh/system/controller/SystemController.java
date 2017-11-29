/**
 * 
 */
package cn.doublehh.system.controller;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.doublehh.system.model.User;
import cn.doublehh.system.model.vo.Result;
import cn.doublehh.system.service.UserService;

/**
 * @author Lay
 *
 */
@Controller
public class SystemController {
	
	@Autowired
	private UserService userService;

	@RequestMapping("/renderLogin")
	public String renderLogin(){
		return "login";
	}
	
	@RequestMapping("/403")
	public String render403(){
		return "403";
	}
	
	@RequestMapping("/login")
	@ResponseBody
	public Result login(UsernamePasswordToken token, HttpSession session) {
		Result result = new Result();
		try {
			Subject subject = SecurityUtils.getSubject();
			subject.login(token);
			subject.getSession().setAttribute("USER", (String)subject.getPrincipal());
			User user = userService.getUserByUid((String)subject.getPrincipal());
			subject.getSession().setAttribute("user", user);
			result.setRole(user.getRemark());
			result.setUser(user);
		} catch (UnknownAccountException e) {
			result.setSuccess(false);
			result.setMsg("帐号不存在");
		}catch(LockedAccountException e){
			result.setSuccess(false);
			result.setMsg("帐号被锁定");
		}catch(AuthenticationException e){
			result.setSuccess(false);
			result.setMsg("帐号密码错误");
		}
		return result;
	}
	
	@RequestMapping("/logout")
	public String logout(){
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "redirect:/cart.do";
	}
	
	@RequestMapping("/index")
	public String index(Model model){
		String uid = (String)SecurityUtils.getSubject().getPrincipal();
		User user = userService.getUserByUid(uid);
		model.addAttribute("user",user);
		return "index";
	}
	
	@RequestMapping("/register")
	@ResponseBody
	public Result register(User user){
		
		return userService.registerUser(user);
	}
}
