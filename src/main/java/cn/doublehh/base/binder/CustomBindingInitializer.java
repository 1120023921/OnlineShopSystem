/**
 * 
 */
package cn.doublehh.base.binder;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.WebBindingInitializer;
import org.springframework.web.context.request.WebRequest;

import com.alibaba.druid.util.StringUtils;

/**
 * @author Lay
 *
 */
public class CustomBindingInitializer implements WebBindingInitializer {

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.springframework.web.bind.support.WebBindingInitializer#initBinder
	 * (org.springframework.web.bind.WebDataBinder,
	 * org.springframework.web.context.request.WebRequest)
	 */
	@Override
	public void initBinder(WebDataBinder binder, WebRequest request) {
		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {

			final SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				try {
					if(StringUtils.isEmpty(text)){
						setValue(null);
					}else{
						Date date = sf.parse(text);
						setValue(date);
					}
				} catch (ParseException e) {
					throw new IllegalArgumentException(e);
				}
			}
		});
	}

}
