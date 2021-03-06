package com.dlnu.pojo;

// Generated 2014-6-26 13:39:02 by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Meeting generated by hbm2java
 */
public class Meeting implements java.io.Serializable {

	private Integer mid;
	private String mname;
	private Mroom mroom;
	private Date starttime;
	private Date endtime;
	private Set userMeetings = new HashSet(0);

	public Meeting() {
	}

	public Meeting(Integer mid) {
		this.mid = mid;
	}

	public Meeting(Integer mid, Mroom mroom, Date starttime, Date endtime,
			Set userMeetings) {
		this.mid = mid;
		this.mroom = mroom;
		this.starttime = starttime;
		this.endtime = endtime;
		this.userMeetings = userMeetings;
	}

	public Integer getMid() {
		return this.mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public Mroom getMroom() {
		return this.mroom;
	}

	public void setMroom(Mroom mroom) {
		this.mroom = mroom;
	}

	public Date getStarttime() {
		return this.starttime;
	}

	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}

	public Date getEndtime() {
		return this.endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	public Set getUserMeetings() {
		return this.userMeetings;
	}

	public void setUserMeetings(Set userMeetings) {
		this.userMeetings = userMeetings;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

}
