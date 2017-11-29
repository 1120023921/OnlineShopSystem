/**
 * 
 */
package cn.doublehh.base.service;

import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.util.StringUtils;

import tk.mybatis.mapper.entity.Example;

/**
 * @author Lay
 *
 */
public class ExampleBuilder extends Example{
	
	
	public ExampleBuilder(Class<?> entityClass){
		super(entityClass);
	}

	public void andEqualTo(Object param) {
        MetaObject metaObject = SystemMetaObject.forObject(param);
        String[] properties = metaObject.getGetterNames();
        for (String property : properties) {
            if (propertyMap.get(property) != null) {
                Object value = metaObject.getValue(property);
                if(value instanceof String){
                	if(!StringUtils.isEmpty(value)){
                		this.createCriteria().andEqualTo(property, value);
                	}
                }
            }
        }
    }
}
