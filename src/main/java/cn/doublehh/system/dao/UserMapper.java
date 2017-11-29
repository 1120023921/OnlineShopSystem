package cn.doublehh.system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.doublehh.system.model.User;
import tk.mybatis.mapper.common.Mapper;

public interface UserMapper extends Mapper<User> {
	User getUserByUid(String uid);

	User getUserWithRolesByUid(String uid);
	
	List<User> getUsersByRoleId(int roleId);
	
	int registerUser(User user);
	
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
	User checkOldPassword(@Param("uid")String uid,@Param("password")String password);
	
	/**
	 * 修改密码
	 * @param uid
	 * @param password
	 * @return
	 */
	int updatePassword(@Param("uid")String uid,@Param("password")String password);
}