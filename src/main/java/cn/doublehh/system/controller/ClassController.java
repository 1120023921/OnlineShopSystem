
package cn.doublehh.system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.doublehh.base.controller.BaseController;
import cn.doublehh.system.model.ClassEntity;
import cn.doublehh.system.service.ClassService;

@Controller
@RequestMapping("/class")
public class ClassController extends BaseController<ClassEntity> {

	@Autowired
	private ClassService classService;


	@RequestMapping(value = "/listBy")
	@ResponseBody
	public PageInfo<ClassEntity> listClasses(@RequestParam int page,
			@RequestParam int rows, @ModelAttribute ClassEntity classeEntity) {
		PageInfo<ClassEntity> pageInfo = classService.listClassesPaged(page, rows,
				classeEntity);
		return pageInfo;
	}


	@RequestMapping(value = "/render")
	public String render() {
		return "system/class/list";
	}

	
}
