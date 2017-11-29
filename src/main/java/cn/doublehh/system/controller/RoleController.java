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
import cn.doublehh.system.model.Role;
import cn.doublehh.system.model.vo.Result;
import cn.doublehh.system.service.RoleResourceService;
import cn.doublehh.system.service.RoleService;
import cn.doublehh.system.service.UserRoleService;

/**
 * @author Lay
 *
 */
@Controller
@RequestMapping("/role")
public class RoleController extends BaseController<Role>{

	@Autowired
	private RoleService roleService;
	
	@Autowired
	private UserRoleService userRoleService;
	
	@Autowired
	private RoleResourceService  roleResourceService;

	@RequestMapping(value = "/list")
	@ResponseBody
	public PageInfo<Role> listRoles(@RequestParam int page,
			@RequestParam int rows,@ModelAttribute Role role) {
		return roleService.listRolesPaged(page,rows,role);
	}
	
	@RequestMapping(value = "/render")
	public String render() {
		return "system/role/list";
	}
	
	@RequestMapping(value = "/getRolesByUserId")
	@ResponseBody
	public List<Role> getRolesByUserId(@RequestParam int userId){
		return roleService.getRolesByUserId(userId);
	}
	
	@RequestMapping(value = "/roleSelect")
	public String roleSelect(Model model,@RequestParam int userId){
		model.addAttribute("userId", userId);
		return "select/roleSelect";
	}
	
	@RequestMapping(value = "/saveRoleUsers")
	@ResponseBody
	public Result saveRoleUsers(@ModelAttribute Role role){
		Result result = new Result();
		try {
			userRoleService.saveRoleUsers(role);
		} catch (Exception e) {
			result.setSuccess(false);
			result.setMsg(e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(value = "/saveRoleResources")
	@ResponseBody
	public Result saveRoleResources(@ModelAttribute Role role){
		Result result = new Result();
		try {
			roleResourceService.saveRoleResources(role);
		} catch (Exception e) {
			result.setSuccess(false);
			result.setMsg(e.getMessage());
		}
		return result;
	}
}
