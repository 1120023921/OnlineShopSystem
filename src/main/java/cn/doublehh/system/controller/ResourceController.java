/**
 * 
 */
package cn.doublehh.system.controller;

import java.util.List;

import cn.doublehh.base.controller.BaseController;
import cn.doublehh.system.model.Resource;
import cn.doublehh.system.service.ResourceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author Lay
 *
 */
@Controller
@RequestMapping("/resource")
public class ResourceController extends BaseController<Resource>{

	@Autowired
	private ResourceService resourceService;
	
	

	@RequestMapping(value = "/render")
	public String render() {
		return "system/resource/list";
	}
	
	@RequestMapping(value = "/list")
	@ResponseBody
	public List<Resource> listResources() {
		return resourceService.listResources();
	}
	
	@RequestMapping(value = "/getResourcesByPidAndType")
	@ResponseBody
	public List<Resource> getResourcesByPidAndType(@ModelAttribute Resource resource){
		return resourceService.getResourcesByPidAndType(resource);
	}
	
	@RequestMapping(value = "/getResourcesByRoleId")
	@ResponseBody
	public List<Resource> getResourcesByRoleId(@RequestParam Integer roleId){
		return resourceService.getResourcesByRoleId(roleId);
	}
	
	@RequestMapping(value = "/resourceSelect")
	public String roleSelect(Model model, @RequestParam int roleId) {
		model.addAttribute("roleId", roleId);
		return "select/resourceSelect";
	}
}
