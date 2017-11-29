
package cn.doublehh.system.service;

import java.util.List;

import cn.doublehh.base.service.BaseService;
import cn.doublehh.system.model.ClassEntity;

import com.github.pagehelper.PageInfo;


public interface ClassService extends BaseService<ClassEntity>{
	
	List<ClassEntity> selectBy(ClassEntity T);
	
	List<ClassEntity> selectAll();
	
	PageInfo<ClassEntity> listClassesPaged(int page,int pageSize,ClassEntity classEntity);
	
	void createAclass(ClassEntity newclass);
	
	void updateAclass(ClassEntity newclass);
	
	ClassEntity getClassByCid(String cid);
}
