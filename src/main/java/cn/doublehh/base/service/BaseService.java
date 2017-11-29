/**
 * 
 */
package cn.doublehh.base.service;

import java.util.List;

/**
 * @author Lay
 *
 */
public interface BaseService<T> {

	T selectByKey(Object key);

	List<T> selectAll();
	
	int save(T entity);

	int delete(Object key);

	int update(T entity);

	int updateNotNull(T entity);

	List<T> selectByExample(Object example);

	// TODO 其他...
}
