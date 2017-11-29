/**
 * 
 */
package cn.doublehh.base.audit.interceptor;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.util.Date;
import java.util.Properties;

import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlCommandType;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.springframework.core.annotation.AnnotationUtils;

import cn.doublehh.base.audit.CreateBy;
import cn.doublehh.base.audit.CreateDate;
import cn.doublehh.base.audit.UpdateBy;
import cn.doublehh.base.audit.UpdateDate;

/**
 * @author Lay
 *
 */
@Intercepts({ @Signature(type = Executor.class, method = "update", args = {
		MappedStatement.class, Object.class }) })
public abstract class AuditingInterceptor implements Interceptor {

	public abstract String getUid();

	private void setValue(Field field, Object parameter,
			Class<? extends Annotation> clazz, Object value)
			throws IllegalAccessException {
		if (AnnotationUtils.getAnnotation(field, clazz) != null) {
			field.setAccessible(true);
			field.set(parameter, value);
			field.setAccessible(false);
		}
	}

	private void handleDataForUpdate(Field[] fields, Object parameter,
			MappedStatement ms) {
		try {
			for (Field field : fields) {
				setValue(field, parameter, UpdateBy.class, getUid());
				setValue(field, parameter, UpdateDate.class, new Date());
			}
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	private void handleDataForInsert(Field[] fields, Object parameter) {
		try {
			for (Field field : fields) {
				setValue(field, parameter, CreateBy.class, getUid());
				setValue(field, parameter, CreateDate.class, new Date());

			}
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.apache.ibatis.plugin.Interceptor#intercept(org.apache.ibatis.plugin
	 * .Invocation)
	 */
	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		MappedStatement ms = (MappedStatement) invocation.getArgs()[0];
		SqlCommandType sqlCommandType = ms.getSqlCommandType();
		Object parameter = invocation.getArgs()[1];
		Field[] fields = parameter.getClass().getDeclaredFields();
		if (SqlCommandType.UPDATE == sqlCommandType) {
			handleDataForUpdate(fields, parameter, ms);
		} else if (SqlCommandType.INSERT == sqlCommandType) {
			handleDataForInsert(fields, parameter);
		}
		return invocation.proceed();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.apache.ibatis.plugin.Interceptor#plugin(java.lang.Object)
	 */
	@Override
	public Object plugin(Object target) {
		if (target instanceof Executor) {
			return Plugin.wrap(target, this);
		} else {
			return target;
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.apache.ibatis.plugin.Interceptor#setProperties(java.util.Properties)
	 */
	@Override
	public void setProperties(Properties properties) {
		// TODO Auto-generated method stub

	}

}
