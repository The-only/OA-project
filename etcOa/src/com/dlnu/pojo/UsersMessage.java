package com.dlnu.pojo;

// Generated 2014-6-26 13:39:02 by Hibernate Tools 3.4.0.CR1


/**
 * UsersMessage generated by hbm2java
 */
public class UsersMessage implements java.io.Serializable {

	private Integer umessid;
	private Message message;
	private Users usersByReceiveid;
	private Users usersBySendid;
	private String issend;
	private String isreceive;
	private String isdelete;

	public UsersMessage() {
	}

	public UsersMessage(Integer umessid, Message message, Users usersBySendid) {
		this.umessid = umessid;
		this.message = message;
		this.usersBySendid = usersBySendid;
	}

	public UsersMessage(Integer umessid, Message message,
			Users usersByReceiveid, Users usersBySendid, String issend,
			String isreceive, String isdelete) {
		this.umessid = umessid;
		this.message = message;
		this.usersByReceiveid = usersByReceiveid;
		this.usersBySendid = usersBySendid;
		this.issend = issend;
		this.isreceive = isreceive;
		this.isdelete = isdelete;
	}

	public Integer getUmessid() {
		return this.umessid;
	}

	public void setUmessid(Integer umessid) {
		this.umessid = umessid;
	}

	public Message getMessage() {
		return this.message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

	public Users getUsersByReceiveid() {
		return this.usersByReceiveid;
	}

	public void setUsersByReceiveid(Users usersByReceiveid) {
		this.usersByReceiveid = usersByReceiveid;
	}

	public Users getUsersBySendid() {
		return this.usersBySendid;
	}

	public void setUsersBySendid(Users usersBySendid) {
		this.usersBySendid = usersBySendid;
	}


	public String getIssend() {
		return issend;
	}

	public void setIssend(String issend) {
		this.issend = issend;
	}

	public String getIsreceive() {
		return this.isreceive;
	}

	public void setIsreceive(String isreceive) {
		this.isreceive = isreceive;
	}

	public String getIsdelete() {
		return this.isdelete;
	}

	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}

}
