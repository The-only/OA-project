package com.dlnu.action.meeting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dlnu.base.action.BaseAction;
import com.dlnu.dao.MroomDao;
import com.dlnu.dao.UsersRoomDao;
import com.dlnu.pojo.Mroom;
import com.dlnu.pojo.UsersRoom;
import com.dlnu.vo.Vo;

public class MeetingRoomAction extends BaseAction {
private Vo vo;
	
	private int cur=1;

	


	private int total;
	private List<Mroom> mroom;
	private List<UsersRoom> ur; 
	@Autowired
	private MroomDao mroomDao;
	@Autowired
	private UsersRoomDao usersRoomDao;
	public MroomDao getMroomDao() {
		return mroomDao;
	}
	public void setMroomDao(MroomDao mroomDao) {
		this.mroomDao = mroomDao;
	}
	public List<Mroom> getMroom() {
		return mroom;
	}
	public void setMroom(List<Mroom> mroom) {
		this.mroom = mroom;
	}
	public Vo getVo() {
		return vo;
	}
	public void setVo(Vo vo) {
		this.vo = vo;
	}
	public int getCur() {
		return cur;
	}
	public void setCur(int cur) {
		this.cur = cur;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	//删除
	public String showDeleteMroom(){
		 
		//mroomDao.delete(vo.getMrid());
		System.out.println("================="+vo.getMrid());
		
		ur=usersRoomDao.getUsersRoom(vo.getMrid());
		if(ur==null)
			System.out.println("=============");

		for(UsersRoom s:ur){
		usersRoomDao.delete(s);
		}
		Mroom m=mroomDao.get(vo.getMrid());
		
			mroomDao.delete(m);
		
		return SUCCESS;
	}
	/*
	 * 显示所有会议室
	 */
	public String showMroom(){
		int pagesize=5;
		total=mroomDao.getTotal(pagesize);
		mroom=mroomDao.getMroom(cur,pagesize);
		System.out.println("size="+mroom.size());
		return SUCCESS;
	}

	/*
	 * 跳转至会议室维护修改界面
	 */
	public String showToUpdateMroom(){
		int mrid=vo.getMrid();
		Mroom mroom=mroomDao.get(mrid);
		vo.setMname(mroom.getMname());
		vo.setMraddress(mroom.getMraddress());
		vo.setMrpeople(mroom.getMrpeople());
		vo.setMracondition(mroom.getMracondition());
		vo.setMrprojector(mroom.getMrprojector());
		return SUCCESS;
	}
	/*
	 * 将会议室修改结果插入数据库
	 */
	public String showUpdateMroom(){
		Mroom room=new Mroom();
		room.setMname(vo.getMname());
		room.setMraddress(vo.getMraddress());
		room.setMrpeople(vo.getMrpeople());
		room.setMracondition(vo.getMracondition());
		room.setMrprojector(vo.getMrprojector());
		mroomDao.update(vo.getMrid(), vo.getMname(), vo.getMraddress(), vo.getMrpeople(), vo.getMracondition(), vo.getMrprojector());
		return SUCCESS;
	}
	/*
	 * 添加会议室
	 */
	

	public String showAddMroom() {
		//Meeting m=new Meeting();
		Mroom mr=new Mroom();
//		m.setMid(vo.getMid());
		
		//m.setMname(vo.getMname());
		mr.setMname(vo.getMname());
		mr.setMrpeople(vo.getMrpeople());
		mr.setMracondition(vo.getMracondition());
		mr.setMrprojector(vo.getMrprojector());
		mroomDao.save(mr);
		
		return SUCCESS;
	}
	
	
}
