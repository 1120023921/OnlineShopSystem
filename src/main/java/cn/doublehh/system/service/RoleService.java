/**
 * 
 */
package cn.doublehh.system.service;

import java.util.List;

import cn.doublehh.base.service.BaseService;
import cn.doublehh.system.model.Role;

import com.github.pagehelper.PageInfo;

/**
 * @author Lay
 *
 */
public interface RoleService extends BaseService<Role>{
	
	List<Role> listRoles(Role role);
	
	PageInfo<Role> listRolesPaged(int page,int pageSize,Role role);
	
	List<Role> getRolesByUserId(int userId);
	
}
