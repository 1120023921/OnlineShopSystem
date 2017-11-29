package cn.doublehh.system.dao;

import cn.doublehh.system.model.RoleResource;
import tk.mybatis.mapper.common.Mapper;

public interface RoleResourceMapper extends Mapper<RoleResource> {
	
	void deleteRoleResourcesByRoleId(int roleId);
	
}