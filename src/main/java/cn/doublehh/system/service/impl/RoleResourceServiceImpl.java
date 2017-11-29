/**
 * 
 */
package cn.doublehh.system.service.impl;

import java.util.HashSet;

import cn.doublehh.base.service.impl.BaseServiceImpl;
import cn.doublehh.system.dao.RoleResourceMapper;
import cn.doublehh.system.model.Resource;
import cn.doublehh.system.model.Role;
import cn.doublehh.system.model.RoleResource;
import cn.doublehh.system.service.RoleResourceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Lay
 *
 */
@Service
public class RoleResourceServiceImpl extends BaseServiceImpl<RoleResource>
		implements RoleResourceService {

	@Autowired
	private RoleResourceMapper roleResourceMapper;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * cn.doublehh.system.service.RoleResourceService#saveRoleResources(net
	 * .zjwu.mis.system.model.Role)
	 */
	@Override
	public void saveRoleResources(Role role) {
		roleResourceMapper.deleteRoleResourcesByRoleId(role.getId());
		for (Resource resource : new HashSet<Resource>(role.getResources())) {
			RoleResource roleResource = new RoleResource();
			roleResource.setRoleId(role.getId());
			roleResource.setResourceId(resource.getId());
			roleResourceMapper.insert(roleResource);
		}
	}

}
