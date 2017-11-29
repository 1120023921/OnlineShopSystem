package cn.doublehh.system.dao;

import cn.doublehh.system.model.ClassEntity;

//import java.util.List;

import tk.mybatis.mapper.common.Mapper;

public interface ClassEntityMapper extends Mapper<ClassEntity> {
	ClassEntity getClassByCid(String cid);	
	
	void deleteClassByCid(String cid);

}