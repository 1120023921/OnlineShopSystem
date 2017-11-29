/**
 * 
 */
package cn.doublehh.base.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.util.StringUtils;

/**
 * @author Lay
 *
 */
public class UrlPermissionsAuthrizationFilter extends AuthorizationFilter {

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.apache.shiro.web.filter.AccessControlFilter#isAccessAllowed(javax
	 * .servlet.ServletRequest, javax.servlet.ServletResponse, java.lang.Object)
	 */
	@Override
	protected boolean isAccessAllowed(ServletRequest request,
			ServletResponse response, Object mappedValue) throws Exception {
		String uri = WebUtils
				.getPathWithinApplication(WebUtils.toHttp(request))
				.substring(1);
		if (StringUtils.isEmpty(uri)) {
			return true;
		} else {
			Subject subject = getSubject(request, response);
			return subject.isPermitted(uri);
		}
	}

}
