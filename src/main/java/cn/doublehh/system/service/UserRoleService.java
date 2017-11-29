/**
 * 
 */
package cn.doublehh.system.service;

import cn.doublehh.base.service.BaseService;
import cn.doublehh.system.model.Role;
import cn.doublehh.system.model.User;
import cn.doublehh.system.model.UserRole;

/**
 * @author Lay
 *
 */
public interface UserRoleService extends BaseService<UserRole>{
	
	void saveUserRoles(User uesr);
	
	void saveRoleUsers(Role role);

}
