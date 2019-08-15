package com.yq.community;
//板块表
public class Board {
 private int boardId;   	//板块主键标识
 private String boardName;	//板块名
 private int parentId;	//父板块主键标识
 private int count;
 private Topic topic;

 
 public int getBoardId() {
	return boardId;
}
public void setBoardId(int boardId) {
	this.boardId = boardId;
}
public String getBoardName() {
	return boardName;
}
public void setBoardName(String boardName) {
	this.boardName = boardName;
}
public int getParentId() {
	return parentId;
}
public void setParentId(int parentId) {
	this.parentId = parentId;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
public Topic getTopic() {
	return topic;
}
public void setTopic(Topic topic) {
	this.topic = topic;
}
 


}
