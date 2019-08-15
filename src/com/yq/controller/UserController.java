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
		//����ļ��Ĵ�С
		long size=up.getSize();
		if(size>0) {
		//���ѡ���ļ����ļ���
			String filename=up.getOriginalFilename();
			String realpath=request.getRealPath("/image/head");//��ȡָ��·��
		//��ν�һ���ļ�������ָ�����ļ��¡�	
			File dest=new File(realpath,filename);//(�ļ�·�����ļ���)
			try {
				up.transferTo(dest);
			} catch (IllegalStateException | IOException e) {				
				e.printStackTrace();
			}
			user.setHead(filename);//���ļ����������⣬����
		}
		String regTime=new Date().toLocaleString();
		user.setRegTime(regTime);
		userDao.insert(user);
		return "login";
	
	}
	
	@RequestMapping("check")
	@ResponseBody    //ajaxע�⣬������תҳ�棬������ֵת���json��
	public List<User> check(String uname) {  //ajax  �ֲ�ˢ�²���תҳ�棬���Բ���String
		List<User> list=userDao.check(uname); //��Ҫʲô���ݣ��ͽ��������ͺͷ���ֵд�ɸ�����
	
		return list; //�������Ϊlist�Ǹ�ҳ��������Ҫ�ı���ʽ������һ��ע��@ResponseBody
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("u");
		return "forward:/board/select";
	}
}
