package com.yq.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.yq.community.Topic;

public interface TopicDao {

	
	@Insert("insert into tbl_topic(title,content,publishTime,modifyTime,userId,boardId) "
			+ " values(#{title},#{content},now(),now(),#{userId},#{boardId})")
	public void insert(Topic topic);
	
	@Select("select t.*,u.uname,u.head,u.regtime from tbl_topic t,tbl_user u where t.userid=u.userid "
			+ " and t.boardId=#{boardId} order by t.publishtime desc limit #{begin},#{rows}")
	public List<Topic> select(Topic topic);

	@Select("select count(*) from tbl_topic where boardid=#{boardId}")
	public int selectcount(int boardId);
	
}
