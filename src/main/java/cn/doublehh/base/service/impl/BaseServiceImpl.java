/**
 * 
 */
package cn.doublehh.base.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.doublehh.base.service.BaseService;
import tk.mybatis.mapper.common.Mapper;

/**
 * @author Lay
 *
 */
public abstract class BaseServiceImpl<T> implements BaseService<T>{
	@Autowired
    protected Mapper<T> mapper;

    @Override
    public T selectByKey(Object key) {
        return mapper.selectByPrimaryKey(key);
    }

    public int save(T entity) {
        return mapper.insert(entity);
    }

    public int delete(Object key) {
        return mapper.deleteByPrimaryKey(key);
    }

    public int update(T entity) {
        return mapper.updateByPrimaryKey(entity);
    }

    public int updateNotNull(T entity) {
        return mapper.updateByPrimaryKeySelective(entity);
    }
    
    public List<T> selectAll(){
    	return  mapper.selectAll();
    }
    
    public List<T> selectByExample(Object example) {
        return mapper.selectByExample(example);
    }
}
