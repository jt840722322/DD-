package com.yq.community;
//����
public class Board {
 private int boardId;   	//���������ʶ
 private String boardName;	//�����
 private int parentId;	//�����������ʶ
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
