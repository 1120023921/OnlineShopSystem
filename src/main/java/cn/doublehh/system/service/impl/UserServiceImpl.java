/**
 * 
 */
package cn.doublehh.system.service.impl;

import java.util.List;

import cn.doublehh.base.service.ExampleBuilder;
import cn.doublehh.base.service.impl.BaseServiceImpl;
import cn.doublehh.business.utils.WebUtils;
import cn.doublehh.system.dao.UserMapper;
import cn.doublehh.system.model.User;
import cn.doublehh.system.model.vo.Result;
import cn.doublehh.system.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * @author Lay
 *
 */
@Service
@Transactional
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {
	
	@Autowired
	private UserMapper userMapper;

	
	/* (non-Javadoc)
	 * @see cn.doublehh.system.service.UserService#listUsers()
	 */
	@Override
	public List<User> listUsers() {
		return userMapper.selectAll();
	}

	/* (non-Javadoc)
	 * @see cn.doublehh.system.service.UserService#getUsersByRoleId(int)
	 */
	@Override
	public List<User> getUsersByRoleId(int roleId) {
		return userMapper.getUsersByRoleId(roleId);
	}


	/* (non-Javadoc)
	 * @see cn.doublehh.system.service.UserService#getUserByUid(java.lang.String)
	 */
	@Override
	public User getUserByUid(String uid) {
		return userMapper.getUserByUid(uid);
	}


	/* (non-Javadoc)
	 * @see cn.doublehh.system.service.UserService#listUsersPaged()
	 */
	@Override
	public PageInfo<User> listUsersPaged(int page,int pageSize,User user) {
		ExampleBuilder example = new ExampleBuilder(user.getClass());
		example.andEqualTo(user);
		PageHelper.startPage(page, pageSize);
		List<User> users = userMapper.selectByExample(example);
		return new PageInfo<User>(users);
	}

	@Override
	public Result registerUser(User user) {

		Result result = new Result();
		if(userMapper.getUserByUid(user.getUid())!=null){
			result.setSuccess(false);
			result.setMsg("用户名已存在");
			return result;
		}
		user.setRemark("普通用户");
		user.setEnabled("Y");
		String md5 = WebUtils.generateToken(user.getPassword());
		user.setPassword(md5.substring(0, md5.length()-2));
		if(userMapper.registerUser(user)>0){
			result.setSuccess(true);
			result.setMsg("注册成功");
			return result;
		}
		result.setSuccess(false);
		result.setMsg("注册失败");
		return result;
	}

	@Override
	public int updatePersonInfo(User user) {

		return userMapper.updatePersonInfo(user);
	}

	/**
	 * 验证旧密码
	 */
	@Override
	public User checkOldPassword(String uid, String password) {

		String md5 = WebUtils.generateToken(password);
		password = md5.substring(0, md5.length()-2);
		return userMapper.checkOldPassword(uid, password);
	}

	/**
	 * 更新密码
	 */
	@Override
	public int updatePassword(String uid, String password) {

		String md5 = WebUtils.generateToken(password);
		password = md5.substring(0, md5.length()-2);
		return userMapper.updatePassword(uid, password);
	}
	
	
}
