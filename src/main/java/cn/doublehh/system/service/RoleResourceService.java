/**
 * 
 */
package cn.doublehh.system.service;

import cn.doublehh.base.service.BaseService;
import cn.doublehh.system.model.Role;
import cn.doublehh.system.model.RoleResource;

/**
 * @author Lay
 *
 */
public interface RoleResourceService extends BaseService<RoleResource>{

	void saveRoleResources(Role role);
}
