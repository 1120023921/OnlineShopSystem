package cn.doublehh.system.dao;

import java.util.List;

import cn.doublehh.system.model.Role;
import tk.mybatis.mapper.common.Mapper;

public interface RoleMapper extends Mapper<Role> {

	List<Role> getRolesByUserId(int userId);

	List<Role> getRolesByUid(String uid);
}