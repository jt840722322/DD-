package com.yq.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yq.Dao.BoardDao;
import com.yq.Dao.UserDao;
import com.yq.community.Board;
import com.yq.community.User;

@Controller
@RequestMapping("user")
public class UserController {
	@Resource
	private UserDao userDao;
	@Resource
	private BoardDao boardDao;
	
	@RequestMapping("login")
	public String login(Model model,User user,HttpSession session){
		User x=userDao.login(user);
		if(x==null) {	
				return "login";
		}else {
		session.setAttribute("u",x);
		model.addAttribute("boards",boardDao.select());
		return "forward:/board/select";
		}
		
	}
	
	@RequestMapping("insert")
	public String insert(MultipartFile up,User user,HttpServletRequest request){
		//获得文件的大小
		long size=up.getSize();
		if(size>0) {
		//获得选择文件的文件名
			String filename=up.getOriginalFilename();
			String realpath=request.getRealPath("/image/head");//获取指定路径
		//如何将一个文件拷贝到指定的文件下。	
			File dest=new File(realpath,filename);//(文件路径，文件名)
			try {
				up.transferTo(dest);
			} catch (IllegalStateException | IOException e) {				
				e.printStackTrace();
			}
			user.setHead(filename);//将文件名传给试题，保存
		}
		String regTime=new Date().toLocaleString();
		user.setRegTime(regTime);
		userDao.insert(user);
		return "login";
	
	}
	
	@RequestMapping("check")
	@ResponseBody    //ajax注解，不会跳转页面，将返回值转变成json串
	public List<User> check(String uname) {  //ajax  局部刷新不跳转页面，所以不用String
		List<User> list=userDao.check(uname); //需要什么数据，就将参数类型和返回值写成该类型
	
		return list; //这里会人为list是个页面名，需要改变形式加另外一个注解@ResponseBody
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("u");
		return "forward:/board/select";
	}
}
