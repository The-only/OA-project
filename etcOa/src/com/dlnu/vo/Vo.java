package com.dlnu.vo;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.dlnu.pojo.Card;
import com.dlnu.pojo.Cardfloder;
import com.dlnu.pojo.Department;
import com.dlnu.pojo.Message;
import com.dlnu.pojo.Mroom;
import com.dlnu.pojo.Postion;
import com.dlnu.pojo.Role;
import com.dlnu.pojo.Users;
import com.dlnu.pojo.UsersMessage;

public class Vo {
	private Integer userid;
	private Postion postion;
	private String uname;
	private String upass;
	/*private String name = "%";*/
	private String name;
	private String sex;
	private Byte age;
	private String email;
	private String tel;
	private String phone;
	private String address;
	private String interest;
	private String introduce;
	private int roleid;
	private Integer workid;
	private String workname;
	private Date workstarttime;
	private Date workendtime;
	private String workcontent;
	private String workActions;

	private Integer did=0;
	private String dname;
	/*private String dname = "%";*/
	private String function;
	private Department department;
	private String postionname = "%";
	private String planname = "%";
	private int usid;
	//xh
	private String xhname;
	private String param="";
	private int postionid;
	private List<Role> roles = new ArrayList<Role>();
	private int cur = 1;
	private Integer total=1;
	private int pagesize=5;
	
	//wk
	private Integer mid;
	private Mroom mroom;
	private Date starttime;
	private Date endtime;
	private String meetingPerson;
	private String mname;
	private Integer mrid;
	//lxh

	private Integer mrpeople;
	private Integer mracondition;
	private Integer mrprojector;
	private String mraddress;
	
	
	/**jeakon**/
	private String cname;
	private Integer cid;
	private Cardfloder cardfloder;
	private String dept;
	private String position;
	private Card card;
	private Users user;
	private static List<Card> cards = new ArrayList<Card>();
	private static List<Department> departments = new ArrayList<Department>();
	private static List<Users> users = new ArrayList<Users>();
	private static List<Postion> postions = new ArrayList<Postion>();
	private static List<Cardfloder> cardfloders = new ArrayList<Cardfloder>();
	private static List<UsersMessage> draftMessages = new ArrayList<UsersMessage>();
	private static List<UsersMessage> unreadMessages = new ArrayList<UsersMessage>();
	private static List<UsersMessage> readMessages = new ArrayList<UsersMessage>();
	private static List<UsersMessage> sendMessages = new ArrayList<UsersMessage>();
	private static Set usersMessages = new HashSet(0);
	private final int PAGESIZE = 4;
	private Integer umessid;
	private Message message;
	private Users usersByReceiveid;
	private Users usersBySendid;
	private String issend;
	private String isreceive;
	private String isdelete;
	private Integer postid;
	private InputStream excelStream;
	private Integer messid;
	private String title;
	private String content;
	private Date date;
	
	public Integer getMessid() {
		return messid;
	}

	public void setMessid(Integer messid) {
		this.messid = messid;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Cardfloder getCardfloder() {
		return cardfloder;
	}

	public void setCardfloder(Cardfloder cardfloder) {
		this.cardfloder = cardfloder;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Card getCard() {
		return card;
	}

	public void setCard(Card card) {
		this.card = card;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public List<Card> getCards() {
		return cards;
	}

	public void setCards(List<Card> cards) {
		this.cards = cards;
	}

	public List<Department> getDepartments() {
		return departments;
	}

	public void setDepartments(List<Department> departments) {
		this.departments = departments;
	}

	public List<Users> getUsers() {
		return users;
	}

	public void setUsers(List<Users> users) {
		this.users = users;
	}

	public List<Postion> getPostions() {
		return postions;
	}

	public void setPostions(List<Postion> postions) {
		this.postions = postions;
	}

	public List<Cardfloder> getCardfloders() {
		return cardfloders;
	}

	public void setCardfloders(List<Cardfloder> cardfloders) {
		this.cardfloders = cardfloders;
	}

	public List<UsersMessage> getDraftMessages() {
		return draftMessages;
	}

	public void setDraftMessages(List<UsersMessage> draftMessages) {
		this.draftMessages = draftMessages;
	}

	public List<UsersMessage> getUnreadMessages() {
		return unreadMessages;
	}

	public void setUnreadMessages(List<UsersMessage> unreadMessages) {
		this.unreadMessages = unreadMessages;
	}

	public List<UsersMessage> getReadMessages() {
		return readMessages;
	}

	public void setReadMessages(List<UsersMessage> readMessages) {
		this.readMessages = readMessages;
	}

	public List<UsersMessage> getSendMessages() {
		return sendMessages;
	}

	public  void setSendMessages(List<UsersMessage> sendMessages) {
		this.sendMessages = sendMessages;
	}

	public Set getUsersMessages() {
		return usersMessages;
	}

	public void setUsersMessages(Set usersMessages) {
		this.usersMessages = usersMessages;
	}

	public Integer getUmessid() {
		return umessid;
	}

	public void setUmessid(Integer umessid) {
		this.umessid = umessid;
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

	public Users getUsersByReceiveid() {
		return usersByReceiveid;
	}

	public void setUsersByReceiveid(Users usersByReceiveid) {
		this.usersByReceiveid = usersByReceiveid;
	}

	public Users getUsersBySendid() {
		return usersBySendid;
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
		return isreceive;
	}

	public void setIsreceive(String isreceive) {
		this.isreceive = isreceive;
	}

	public String getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}

	public Integer getPostid() {
		return postid;
	}

	public void setPostid(Integer postid) {
		this.postid = postid;
	}

	public InputStream getExcelStream() {
		return excelStream;
	}

	public void setExcelStream(InputStream excelStream) {
		this.excelStream = excelStream;
	}

	/**jeakon**/
	public Integer getMrpeople() {
		return mrpeople;
	}

	public void setMrpeople(Integer mrpeople) {
		this.mrpeople = mrpeople;
	}

	public Integer getMracondition() {
		return mracondition;
	}

	public void setMracondition(Integer mracondition) {
		this.mracondition = mracondition;
	}

	public Integer getMrprojector() {
		return mrprojector;
	}

	public void setMrprojector(Integer mrprojector) {
		this.mrprojector = mrprojector;
	}

	public String getMraddress() {
		return mraddress;
	}

	public void setMraddress(String mraddress) {
		this.mraddress = mraddress;
	}

	public Integer getMid() {
		return mid;
	}
	
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public Mroom getMroom() {
		return mroom;
	}
	public void setMroom(Mroom mroom) {
		this.mroom = mroom;
	}
	public Date getStarttime() {
		return starttime;
	}
	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	public String getMeetingPerson() {
		return meetingPerson;
	}
	public void setMeetingPerson(String meetingPerson) {
		this.meetingPerson = meetingPerson;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public Integer getMrid() {
		return mrid;
	}
	public void setMrid(Integer mrid) {
		this.mrid = mrid;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Postion getPostion() {
		return postion;
	}
	public void setPostion(Postion postion) {
		this.postion = postion;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Byte getAge() {
		return age;
	}
	public void setAge(Byte age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public int getRoleid() {
		return roleid;
	}
	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}
	public Integer getWorkid() {
		return workid;
	}
	public void setWorkid(Integer workid) {
		this.workid = workid;
	}
	public String getWorkname() {
		return workname;
	}
	public void setWorkname(String workname) {
		this.workname = workname;
	}
	public Date getWorkstarttime() {
		return workstarttime;
	}
	public void setWorkstarttime(Date workstarttime) {
		this.workstarttime = workstarttime;
	}
	public Date getWorkendtime() {
		return workendtime;
	}
	public void setWorkendtime(Date workendtime) {
		this.workendtime = workendtime;
	}
	public String getWorkcontent() {
		return workcontent;
	}
	public void setWorkcontent(String workcontent) {
		this.workcontent = workcontent;
	}
	public String getWorkActions() {
		return workActions;
	}
	public void setWorkActions(String workActions) {
		this.workActions = workActions;
	}
	public Integer getDid() {
		return did;
	}
	public void setDid(Integer did) {
		this.did = did;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getFunction() {
		return function;
	}
	public void setFunction(String function) {
		this.function = function;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public String getPostionname() {
		return postionname;
	}
	public void setPostionname(String postionname) {
		this.postionname = postionname;
	}
	public String getPlanname() {
		return planname;
	}
	public void setPlanname(String planname) {
		this.planname = planname;
	}
	public int getUsid() {
		return usid;
	}
	public void setUsid(int usid) {
		this.usid = usid;
	}
	public String getXhname() {
		return xhname;
	}
	public void setXhname(String xhname) {
		this.xhname = xhname;
	}
	public String getParam() {
		return param;
	}
	public void setParam(String param) {
		this.param = param;
	}
	public int getPostionid() {
		return postionid;
	}
	public void setPostionid(int postionid) {
		this.postionid = postionid;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public int getCur() {
		return cur;
	}
	public void setCur(int cur) {
		this.cur = cur;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public int getPAGESIZE() {
		return PAGESIZE;
	}
	
	
}