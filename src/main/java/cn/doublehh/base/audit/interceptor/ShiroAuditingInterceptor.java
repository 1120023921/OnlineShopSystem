/**
 * 
 */
package cn.doublehh.base.audit.interceptor;

import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Signature;
import org.apache.shiro.SecurityUtils;

/**
 * @author Lay
 *
 */
@Intercepts({ @Signature(type = Executor.class, method = "update", args = {
	MappedStatement.class, Object.class }) })
public class ShiroAuditingInterceptor extends AuditingInterceptor{

	/* (non-Javadoc)
	 * @see net.zjwu.mis.audit.interceptor.AuditingInterceptor#getUid()
	 */
	@Override
	public String getUid() {
		return (String)SecurityUtils.getSubject().getPrincipal();
	}

}
