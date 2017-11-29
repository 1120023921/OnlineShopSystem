package cn.doublehh.system.dao;

import java.util.List;

import cn.doublehh.system.model.Resource;
import tk.mybatis.mapper.common.Mapper;

public interface ResourceMapper extends Mapper<Resource> {
	
	List<Resource> getResourcesByPidAndType(Resource resource);
	
	List<Resource> getResourcesByRoleId(int roleId);
}