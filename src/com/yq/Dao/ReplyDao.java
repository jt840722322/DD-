package com.yq.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.yq.community.Reply;
import com.yq.community.Topic;
import com.yq.community.User;

public interface ReplyDao {
	@Insert("insert into tbl_reply(title,content,publishtime,modifytime,userid,topicid) "
			+ " values(#{title},#{content},now(),now(),#{userId},#{topicId}) ")
	public void insert(Reply reply);
	
	@Select(" select r.*,u.uName,u.head,u.regTime from tbl_reply r ,tbl_user  u where r.userid=u.userid and " + 
			" r.topicid=#{topicId} order by r.publishTime desc limit #{begin},#{rows}")
	public List<Reply> select(Reply reply);  //这里用到的u.uName,u.head,u.regTime  在reply中封装着

	@Select("select * from tbl_topic where topicid=#{topicId}")
	public Topic select2(Reply reply);//查询主贴的数据
	
	@Select("select * from tbl_user where userid=(select userId from tbl_topic where topicId=#{topicId})")
	public User select1(Reply reply);
	
	@Select("select count(*) from tbl_reply where topicid=#{topicId}")
	public int selectcount(Reply reply);
	
	//删除回帖。
	@Delete("delete  from tbl_reply where replyId=#{replyId}")
	public void delete(Reply reply);
	
	@Select("select * from tbl_reply where replyId=#{replyId}")
	public Reply edit(Reply reply);
	
	@Update("update tbl_reply set title=#{title},content=#{content},modifyTime=now() where replyId=#{replyId}")
	public void update(Reply reply);
	
	
	
}
