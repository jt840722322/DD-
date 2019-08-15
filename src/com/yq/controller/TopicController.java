package com.yq.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yq.Dao.TopicDao;
import com.yq.community.Topic;

@Controller
@RequestMapping("topic")
public class TopicController {
	@Resource
	private TopicDao topicDao;
	
	//ajax��ҳ
	@RequestMapping("ajaxselect")
	@ResponseBody
	public List<Topic> ajaxselect(Topic topic){
		//��һҳ֮��ʼ
		//��page-1��*rows
		topic.setBegin((topic.getPage()-1)*topic.getRows());
		List<Topic> list=topicDao.select(topic);
		return list;
	}
	
	//�����ҳ����ajax
	
	@RequestMapping("select")
	public String select(Topic topic,Model model){
		List<Topic> list=topicDao.select(topic);
		model.addAttribute("lists",list);
		model.addAttribute("boardss",topic);
		//ajax��ҳ������
	    int count=topicDao.selectcount(topic.getBoardId());
	    int totalpages=count%topic.getRows()==0?count/topic.getRows():count/topic.getRows()+1;
		model.addAttribute("totalpages",totalpages);
	    
		return "list";
	}
	
	@RequestMapping("insert")
	public String insert(Topic topic) {
	

		topicDao.insert(topic);
	
		return "redirect:/topic/select?boardId="+topic.getBoardId()+"&boardName="+topic.getBoardName();
	}

}
