package com.yq.community;
//������
public class Reply  extends PageUtil{
	private int replyId;    //����id'
	private String title;	//����
	private String content;		//����	
	private String publishTime;	//����ʱ��	
	private String modifyTime;	//�޸�ʱ��	
	private int userId;	//�û�id
	private int topicId;	//����������ʶ
	//�û�����չ
	private String uName;
	private String head;
	private String regTime;
	//������չ�б�
	private String mtitle;
	private String mcontent;
	private String mpublishTime;
	private String mmodifyTime;
	private String top1;
	public String getTop1() {
		return top1;
	}
	public void setTop1(String top1) {
		this.top1 = top1;
	}
	public int getReplyId() {
		return replyId;
	}
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
	}
	public String getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(String modifyTime) {
		this.modifyTime = modifyTime;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getTopicId() {
		return topicId;
	}
	public void setTopicId(int topicId) {
		this.topicId = topicId;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public String getRegTime() {
		return regTime;
	}
	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}
	public String getMtitle() {
		return mtitle;
	}
	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}
	public String getMcontent() {
		return mcontent;
	}
	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}
	public String getMpublishTime() {
		return mpublishTime;
	}
	public void setMpublishTime(String mpublishTime) {
		this.mpublishTime = mpublishTime;
	}
	public String getMmodifyTime() {
		return mmodifyTime;
	}
	public void setMmodifyTime(String mmodifyTime) {
		this.mmodifyTime = mmodifyTime;
	}
	

	
}
