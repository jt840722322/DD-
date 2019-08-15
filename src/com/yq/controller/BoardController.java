package com.yq.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yq.Dao.BoardDao;
import com.yq.Dao.TopicDao;
import com.yq.community.Board;
import com.yq.community.Topic;

@Controller
@RequestMapping("board")
public class BoardController {
   @Resource
	private BoardDao boardDao;
   @Resource
    private TopicDao topicDao;
   
   @RequestMapping("select")
   public String select(Model model) {
	   List<Board> list=boardDao.select();
	   if(list.size()!=0) {
		   for(Board b:list) {
			   Topic t=new Topic();
			   t.setBoardId(b.getBoardId());
			List<Topic>  topics=topicDao.select(t);   //拆分集合，将集合数据填充进去
			if(topics.size()!=0) {
				Topic topic=topics.get(0);
				b.setTopic(topic);
			}
		   }
	   }
	   model.addAttribute("boards",list);
	   return "index";
   }
   
  //子版块的修改 1
   @RequestMapping("edit")
   public String Edit(Board board,Model model) {
	   board=boardDao.edit(board);
	   List<Board> list=boardDao.select2();
	   model.addAttribute("father",list);
	   model.addAttribute("boardson",board);
	   return "board";
   }
   
   @RequestMapping("update")
   public String update(Board board) {
	   boardDao.update(board);
	   return "forward:/board/select";
   }
}
