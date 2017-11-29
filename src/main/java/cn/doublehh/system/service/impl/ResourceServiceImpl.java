/**
 * 
 */
package cn.doublehh.system.service.impl;

import java.util.List;

import cn.doublehh.base.service.impl.BaseServiceImpl;
import cn.doublehh.system.dao.ResourceMapper;
import cn.doublehh.system.model.Resource;
import cn.doublehh.system.service.ResourceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.entity.Example;

/**
 * @author Lay
 *
 */
@Service
@Transactional
public class ResourceServiceImpl extends BaseServiceImpl<Resource> implements
		ResourceService {
	@Autowired
	private ResourceMapper resourceMapper;
	
	private void updateParent(Resource resource){
		Integer pid = resource.getPid();
		if (pid != null) {
			Resource parentResource = resourceMapper.selectByPrimaryKey(pid);
			parentResource.setLeaf("N");
			resourceMapper.updateByPrimaryKey(parentResource);
		}
	}
	
	/*
	 * (non-Javadoc)
	 * @see cn.doublehh.service.impl.BaseServiceImpl#save(java.lang.Object)
	 */
	public int save(Resource resource) {
		updateParent(resource);
		return resourceMapper.insert(resource);
	}
	/*
	 * (non-Javadoc)
	 * @see cn.doublehh.service.impl.BaseServiceImpl#update(java.lang.Object)
	 */
	public int update(Resource resource) {
		updateParent(resource);
		return resourceMapper.updateByPrimaryKey(resource);
	}

	public int delete(Object key) {
		Resource resource = resourceMapper.selectByPrimaryKey(key);
		int result = resourceMapper.deleteByPrimaryKey(key);
		Integer pid = resource.getPid();
		if (pid != null) {
			Example example = new Example(Resource.class);
			example.createCriteria().andEqualTo("pid", pid);
			int count = resourceMapper.selectCountByExample(example);
			Resource parentResource = resourceMapper
					.selectByPrimaryKey(pid);
			if (count > 0) {
				parentResource.setLeaf("N");	
			}else{
				parentResource.setLeaf("Y");
			}
			resourceMapper.updateByPrimaryKey(parentResource);
		}
		return result;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see cn.doublehh.system.service.ResourceService#listResources()
	 */
	@Override
	public List<Resource> listResources() {
		return resourceMapper.selectAll();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * cn.doublehh.system.service.ResourceService#getResourcesByPidAndType(
	 * cn.doublehh.system.model.Resource)
	 */
	@Override
	public List<Resource> getResourcesByPidAndType(Resource resource) {
		return resourceMapper.getResourcesByPidAndType(resource);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * cn.doublehh.system.service.ResourceService#getResourcesByRoleId(java
	 * .lang.Integer)
	 */
	@Override
	public List<Resource> getResourcesByRoleId(Integer roleId) {
		return resourceMapper.getResourcesByRoleId(roleId);
	}
}
