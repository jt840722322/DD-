package com.yq.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.yq.community.Board;

public interface BoardDao {
		@Select(/*"select * ,  "+
				" (select count(*) from tbl_topic where boardid=tbl_board.boardid) count, "+
				" (select topicid from tbl_topic where boardid=tbl_board.boardid order by publishtime desc limit 0,1) topicid,  " + //最新的帖子
				" (select title from tbl_topic where boardid=tbl_board.boardid order by publishtime desc limit 0,1) title, " + 
				" (select publishtime from tbl_topic where boardid=tbl_board.boardid order by publishtime desc limit 0,1) publishtime,  " + 
				" (select uname from tbl_topic,tbl_user where tbl_topic.boardid=tbl_board.boardid and tbl_topic.userid=tbl_user.userid  " + 
				" order by tbl_topic.publishtime desc limit 0,1) uname  " +//用户名 
				" from tbl_board")*/
 		"select *,(select count(*) from tbl_topic"
		+ " where boardid=tbl_board.boardid) " + 
		" count from tbl_board ")
		public List<Board> select();
		
		@Select("select * from tbl_board where boardid=#{boardId}")
		public Board edit(Board board);
		
		//查询父板块
		@Select("select * from tbl_board where parentId=0")
		public List<Board> select2();
		
		@Update("update tbl_board set boardName=#{boardName},parentId=#{parentId} where boardid=#{boardId}")
		public void update(Board board);
}
