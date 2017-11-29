/**
 * 
 */
package cn.doublehh.system.service;

import java.util.List;

import cn.doublehh.base.service.BaseService;
import cn.doublehh.system.model.Resource;

/**
 * @author Lay
 *
 */
public interface ResourceService extends BaseService<Resource>{

	List<Resource> listResources();

	List<Resource> getResourcesByPidAndType(Resource resource);
	
	List<Resource> getResourcesByRoleId(Integer roleId);
}
