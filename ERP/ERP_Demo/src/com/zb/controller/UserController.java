package com.zb.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.zb.entity.Role;
import com.zb.entity.Users;
import com.zb.service.RoleService;
import com.zb.service.UserService;

@Component
@Scope("prototype")
@RequestMapping("/user.do")
@SessionAttributes({"sys_user","numrand"})
public class UserController {


		
		@Resource(name = "userService")
		private UserService userService;
		
		private RoleService roleService;
		
		/**
		 * 登录 ： 用户名、密码、验证码
		 * @param uname
		 * @param upwd
		 * @param verCode 
		 * @param map
		 * @param numrand 
		 * @return
		 */
		@RequestMapping(params ="op=login",method = RequestMethod.POST)
		public String login(String uname,String upwd,String verCode,ModelMap map,@ModelAttribute("numrand") String numrand){
			
			if(!numrand.equals(verCode)){
				map.put("msg", "验证码错误！");
				return "forward:login.jsp";
			}
				Users user =  userService.findUserLogin(uname, upwd);
					if(user==null){
						map.put("msg", "登录失败,请检查用户名密码是否正确");
						return "login";
					}else{
						map.put("sys_user", user);
						return "redirect:main.jsp";
					}
		}
		
		/**
		 * 分页展示
		 * @param page
		 * @param rows
		 * @param uname
		 * @return
		 */
		@RequestMapping(params = "pageUser")
		@ResponseBody
		public Map<String,Object> findUserPage(Integer page,Integer rows,String uname,String username){
			Map<String,Object> map = new HashMap<String, Object>();
			List<Users> list = userService.findUserlist(page,rows, uname,username);
			int count = userService.findUserCount(uname,username);
			map.put("rows",list);
			map.put("total",count);
			return map;
		}
		/**
		 * 新增用户
		 * @param users
		 * @return
		 */
		@RequestMapping(params="addUser" )
		@ResponseBody
		public boolean addUser(Users users,Integer rid){
			Role role = new Role();
			role.setRid(rid);
			users.setRole(role);
			int num=userService.addUser(users);
			if(num>0){
				return true;
			}else{
				return false;
			}
		}
		
		/**
		 * 更新
		 * @param users
		 * @param rid
		 * @return
		 */
		@RequestMapping(params = "updateUser")
		@ResponseBody
		public String  updateUser(Users users,Integer rid){
			Role role = new Role();
			role.setRid(rid);
			users.setRole(role);
			
//			if(users.getUname()!=null && !"".equals(users.getUname())){
//				u.setUname(users.getUname());
//			}
//			if(users.getRole().getRid()!=null && users.getRole().getRid()>0){
//				u.setRole(users.getRole());
//			}
//			if(users.getUpwd()!=null && !"".equals(users.getUpwd())){
//				u.setUpwd(users.getUpwd());
//			}
			
			try {
				userService.updateUser(users);
				return "ok";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "error";
			}
//			if(num>0){
//				return true;
//			}else{
//				return false;
//			}
		} 
		/**
		 * 删除用户
		 * @param uid
		 * @return
		 */
		@RequestMapping(params = "delUsers")
		@ResponseBody
		public String delUsers(Integer uid){
			try {
				userService.delUser(uid);
				return "ok";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				return "input";
		}
		
		/**
		 * 按id查用户
		 * @param userId
		 * @return
		 */
		@RequestMapping(params="userById")
		@ResponseBody
		public Users findUserById(Integer uid){
			Users user=userService.findUserByid(uid);
			return user;
		}
	
		/**
		 * 下拉列表显示全部用户
		 * @return
		 */
		@RequestMapping(params="findUsers")
		@ResponseBody
		public List<Users> findUsers(){
			int count=userService.findUserCount(null, null);
			List<Users> list=userService.findUserlist(1,count,null,null);
			return list;
		}
		
		/**
		 * 验证用户名是否存在
		 * @param name
		 * @return
		 */
		@RequestMapping(params="userNameChecked")
		@ResponseBody
		public String  userNameChecked(String uname){
			int num=userService.userNameChecked(uname);
			if(num>0){
				return "no";
			}else{
				return "ok";
			}
		}

}
