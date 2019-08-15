package com.yq.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.yq.community.User;

public interface UserDao {
	@Select("select * from tbl_user where uname=#{uName} and upass=#{uPass}")
	public User login(User user);
	
	@Insert("insert into tbl_user(uName,uPass,head,regTime,gender) "
			+ " values(#{uName},#{uPass},#{head},#{regTime},#{gender}) ")
	public void insert(User user);
	
	@Select("select * from tbl_user where uName=#{uName}")
	public List<User> check(String uname);
}
