package com.dlnu.vo;

import java.util.Date;

public class Schedules {
	private String sname;
	private Date start;
	private Date end;
	private String planname;

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	public String getPlanname() {
		return planname;
	}

	public void setPlanname(String planname) {
		this.planname = planname;
	}

	public Schedules(String sname, Date start, Date end, String planname) {
		super();
		this.sname = sname;
		this.start = start;
		this.end = end;
		this.planname = planname;
	}
}
