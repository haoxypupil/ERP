package com.zb.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zb.entity.Role;
import com.zb.entity.Users;
import com.zb.mapper.RoleMapper;
import com.zb.mapper.UserMapper;
import com.zb.service.UserService;

@Component("userService")
public class UserSerciveImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private RoleMapper roleMapper;
	
	public Users findUserLogin(String uname, String upwd) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("uname", uname);
		map.put("upwd",upwd);
		Users u = userMapper.findUserLogin(map);
		//调用权限
		Role role = roleMapper.getRoleInfo(u.getUid());
		u.setRole(role);
		return u;
	}

	public List<Users> findUserlist(Integer index, Integer size, String uname,String username) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start",(index-1)*size);
		map.put("end", index*size);
		if(uname!=null&&!"".equals(uname)){
			map.put("uname",uname);
		}
		if(username!=null&&!"".equals(username)){
			map.put("username",username);
		}
		List<Users> list = userMapper.findUserlist(map);
		return list;
	}

	public Integer findUserCount(String uname,String username) {
		Map<String,Object> map = new HashMap<String, Object>();
		if(uname!=null&&!"".equals(uname)){
			map.put("uname",uname);
		}
		if(username!=null&&!"".equals(username)){
			map.put("username",username);
		}
		int count = userMapper.findUserCount(map);
		return count;
	}

	public int addUser(Users users) {
		return userMapper.addUser(users);
	}

	public void updateUser(Users users) {
		// TODO Auto-generated method stub
		userMapper.updateUser(users);
	}

	public void delUser(Integer uid) {
		// TODO Auto-generated method stub
		userMapper.delUser(uid);
	}

	public Users findUserByid(Integer uid) {
		// TODO Auto-generated method stub
		Users users = userMapper.findUserById(uid);
		return users;
	}

	public int userNameChecked(String uname) {
		
		return userMapper.userNameChecked(uname);
	}


}
