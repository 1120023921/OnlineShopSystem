/**
 * 
 */
package cn.doublehh.system.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.doublehh.base.controller.BaseController;
import cn.doublehh.system.model.User;
import cn.doublehh.system.model.vo.Result;
import cn.doublehh.system.service.UserRoleService;
import cn.doublehh.system.service.UserService;

/**
 * @author Lay
 *
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController<User> {

	@Autowired
	private UserService userService;

	@Autowired
	private UserRoleService userRoleService;

	@RequestMapping(value = "/list")
	@ResponseBody
	public PageInfo<User> listUsers(@RequestParam int page,
			@RequestParam int rows, @ModelAttribute User condition) {
		PageInfo<User> pageInfo = userService.listUsersPaged(page, rows,
				condition);
		return pageInfo;
	}

	@RequestMapping(value = "/render")
	public String render() {
		return "system/user/list";
	}

	@RequestMapping(value = "/saveUserRoles")
	@ResponseBody
	public Result saveUserRoles(@ModelAttribute User user) {
		Result result = new Result();
		try {
			userRoleService.saveUserRoles(user);
		} catch (Exception e) {
			result.setSuccess(false);
			result.setMsg(e.getMessage());
		}
		return result;
	}

	@RequestMapping(value = "/getUsersByRoleId")
	@ResponseBody
	public List<User> getUsersByUserId(@RequestParam int roleId) {
		return userService.getUsersByRoleId(roleId);
	}

	@RequestMapping(value = "/userSelect")
	public String roleSelect(Model model, @RequestParam int roleId) {
		model.addAttribute("roleId", roleId);
		return "select/userSelect";
	}
	
}
