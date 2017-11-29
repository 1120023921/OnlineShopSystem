/**
 * 
 */
package cn.doublehh.system.service;

import java.util.List;

import cn.doublehh.base.service.BaseService;
import cn.doublehh.system.model.User;
import cn.doublehh.system.model.vo.Result;

import com.github.pagehelper.PageInfo;

/**
 * @author Lay
 *
 */
public interface UserService extends BaseService<User>{
	
	List<User> listUsers();
	
	PageInfo<User> listUsersPaged(int page,int pageSize,User user);
	
	List<User> getUsersByRoleId(int roleId);
	
	User getUserByUid(String uid);
	
	Result registerUser(User user);
	
	/**
	 * 更新收货信息
	 * @param user
	 * @return
	 */
	int updatePersonInfo(User user);
	
	/**
	 * 验证旧密码
	 * @param uid
	 * @param password
	 * @return
	 */
	User checkOldPassword(String uid,String password);
	
	/**
	 * 修改密码
	 * @param uid
	 * @param password
	 * @return
	 */
	int updatePassword(String uid,String password);
}
