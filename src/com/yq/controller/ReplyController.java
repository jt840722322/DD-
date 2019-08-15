package com.yq.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yq.Dao.ReplyDao;
import com.yq.community.Reply;
import com.yq.community.Topic;
import com.yq.community.User;

@Controller
@RequestMapping("reply")
public class ReplyController {
	@Resource
	private ReplyDao replyDao;
	
	@RequestMapping("select")
	public String select(Reply reply,Model model){
		//回帖
		List<Reply> list=replyDao.select(reply);
		model.addAttribute("replylist",list);   
		//查询主贴信息
		Topic topic=new Topic();
		topic=replyDao.select2(reply);
		model.addAttribute("you",topic);
		//查询主贴的用户信息
		User user=new User();
		user=replyDao.select1(reply);
		model.addAttribute("zuo", user);
	    //返回ajax总页数
		model.addAttribute("replys",reply);
		int count=replyDao.selectcount(reply);
		int total=count%reply.getRows()==0?count/reply.getRows():count/reply.getRows()+1;
		model.addAttribute("total",total);
		return "detail";
	}
	
	@RequestMapping("insert")
	public String insert(Reply reply) {
		replyDao.insert(reply);
		return "forward:/reply/select";
	}
	
	@RequestMapping("ajaxselect")
	@ResponseBody
	public List<Reply> ajaxselect(Reply reply){
		reply.setBegin((reply.getPage()-1)*reply.getRows());
		List<Reply> list=replyDao.select(reply);
		return list;
	}
	
	//删除回帖。
	@RequestMapping("delete")
	public String delete(Reply reply) {
		replyDao.delete(reply);
		return "forward:/reply/select";
	}
	
	//updateFirst
	@RequestMapping("edit")
	public String edit(Reply reply,Model model) {
	reply=replyDao.edit(reply);
		model.addAttribute("rup",reply);
		return "update";
	}
	
	@RequestMapping("update")
	public String update(Reply reply) {
		replyDao.update(reply);
		System.out.println(reply.getTopicId());
		return "redirect:/reply/select?topicId="+reply.getTopicId();
	}
	
}
