package com.cl.ssm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cl.ssm.pojo.Course;
import com.cl.ssm.pojo.Student;
import com.cl.ssm.service.CourseService;
import com.cl.ssm.util.Takepage;

@Controller  
@RequestMapping("course") 
public class CourseController {
	@Resource 
    private CourseService courseService;
	/**
	 * 选课
	 * @param request
	 * @param va
	 * @param course
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="save")
    public String save(HttpServletRequest request,String va,Course course) throws Exception{
		int id = Integer.parseInt(va);
		course =  courseService.oneCourse(id);
		String coursetype = null;
		if(course.getCoursetype()==null||course.getCoursetype()==""){
			 coursetype="7";
		}else{
			 coursetype = course.getCoursetype();
		}
		if( course.getCoursesy()<=0){
			 request.setAttribute("message", "该课程已经选满了，不可以再选！！");
			 return allcourse(request,coursetype);
		}
		Map<String,Object> map = new HashMap<String, Object>();
		Student student = (Student) request.getSession().getAttribute("student");
		int id1 = student.getId();
		map.put("id", id1);
		List<Course> findlist = courseService.findCourse(map);
		for (Course course2 : findlist) {
			if(course2.getCoursename().equals(course.getCoursename())&&course2.getCoursetime().equals(course.getCoursetime())){
				 request.setAttribute("message", "该课程你已经选过，不能重复选！！");
				 
				 return allcourse(request,coursetype);
			}
		}
		
		course.setCoursesy(course.getCoursesy()-1);
		course.setCoursepeople(course.getCoursepeople()+1);
		courseService.updateCourse(course);
		course.setType(course.getCoursetype());
		course.setCoursetype(null);
		Student s =(Student) request.getSession().getAttribute("student");
		course.getStudents().add(s);
		//courseService.save(course);//插入课程到数据库（要先将外键表插入）
    		 request.setAttribute("message", "添加信息成功");
    		 return allcourse(request,coursetype);
    	}
	/**
	 * 查看全部课程
	 * @param request
	 * @param coursetype
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(params="all")
	public String allcourse(HttpServletRequest request,String coursetype) {
		String pageNo1 = request.getParameter("pageNo");
		if(pageNo1==null||pageNo1==""){
			pageNo1="1";
		}
		Map<String, Object> map = new HashMap<String ,Object>();
		int pageNo = Integer.parseInt(pageNo1);
		Takepage<Course> page = new Takepage<Course>();
		page.setPageNo(pageNo);
		page.setPageSize(2);
		map.put("coursetype", coursetype);
		map.put("start", ((page.getPageNo()-1)*page.getPageSize()));
		map.put("size", page.getPageSize());
		map.put("pagel", page);
		List<Course> list = null;
		int total=0;
		if(coursetype==null||coursetype==""){
			 return "html";
		}else{
			if("7".equals(coursetype)){//查找已经选了的课程
				Student student = (Student) request.getSession().getAttribute("student");
				int id = student.getId();
				map.put("id", id);
				 list  = courseService.findCourse(map);
				 total=courseService.findCourseTotal(map);
			}else{//查找其他全部课程
				list  = courseService.selectAllPage(map);
				 total=courseService.getTotal(map);
			}
			Takepage<Course> pagelist = (Takepage<Course>) map.get("pagel");
			pagelist.setPsize(list.size());
			pagelist.setList(list);
			pagelist.setTotalRecords(total);
	    	request.setAttribute("page", pagelist);
	    	request.setAttribute("pagetype", coursetype);
	        int type=Integer.parseInt(coursetype);
			if(type==1){
				coursetype = "体育任选[体育]";
			}if(type==2){
				coursetype = "必修";
			}if(type==3){
				coursetype = "专选";
			}if(type==4){
				coursetype = "必修分组";
			}if(type==5){
				coursetype = "专选分组";
			}if(type==6){
				coursetype = "任选[公选]";
			}if(type==7){
				coursetype = "已选课程";
			}
			request.setAttribute("coursetype", coursetype);
	        return "courselist";
		}
	    }
	/**
	 * ajax查找选了重复的课程
	 * @throws IOException 
	 */
	@RequestMapping(params="chongfu")
	public void oneCourse(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String va = request.getParameter("type");
		response.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(va);
		if (id==0){
			return ;
		}
		boolean flage = false;
		Course course =  courseService.oneCourse(id);
		Student student = (Student) request.getSession().getAttribute("student");
		int id1 = student.getId();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("id",id1);
		List<Course> findlist = courseService.findCourse(map);
		for (Course course2 : findlist) {
			if(course2.getCoursename().equals(course.getCoursename())&&course2.getCoursetime().equals(course.getCoursetime())){
				 PrintWriter out = response.getWriter();
				 out.write("该课程已选过");
				 flage = true;
				 break;
			}
		if(course2.getCoursename().equals(course.getCoursename())==false){
			flage = false;
		}
	}
		if(!flage){
			PrintWriter out = response.getWriter();
			 out.write("该课程未选过");
		}
	}
	/*
	 * 退选课程
	 */
	@RequestMapping(params="saveout")
	public String oneCourse(HttpServletRequest request,String va){
		int id = Integer.parseInt(va);
		Course course =  courseService.oneCourse(id);
		String coursetype = course.getCoursetype();
		/*if(course.getType()==null||course.getType()==""){
			request.setAttribute("message", "你未选择该课程，不需要退课！！");
			 return allcourse(request,coursetype);
		}*/
		Map<String,Object> map = new HashMap<String, Object>();
		int courseid = 0;
		if(coursetype==null||coursetype==""){
				coursetype="7";
				String type = course.getType();
				map.put("type", type);
				List<Course> courselist = courseService.selectAllPage(map);
				for (Course course2 : courselist) {
					if(course2.getCoursename().equals(course.getCoursename())&&course2.getCoursetime().equals(course.getCoursetime())){
						 courseid = course2.getId();
						 break;
					}
				}
				Student student = (Student) request.getSession().getAttribute("student");
				int studentsid = student.getId();
				map.put("studentsid",studentsid);
				map.put("courseid",id);
				int delete =courseService.deleteCourseS(map, id);
				if(delete==0){
					request.setAttribute("message", "课程退选失败");
					 return allcourse(request,coursetype);
				}
				course = courseService.oneCourse(courseid);
				course.setCoursesy(course.getCoursesy()+1);
				course.setCoursepeople(course.getCoursepeople()-1);
				courseService.updateCourse(course);
				request.setAttribute("message", "课程退选成功");
				 return allcourse(request,coursetype);
			
		}else{
			Student student = (Student) request.getSession().getAttribute("student");
			int id1 = student.getId();
			map.put("studentsid",id1);
			map.put("courseid",id);
			List<Course> findlist = courseService.findCourse(map);
			for (Course course2 : findlist) {
				if(course2.getCoursename().equals(course.getCoursename())&&course2.getCoursetime().equals(course.getCoursetime())){
					 courseid = course2.getId();
					 break;
				}
			}
			map.put("courseid",courseid);
			if(courseid==0){
				request.setAttribute("message", "你未选择该课程，不需要退课！！");
				 return allcourse(request,coursetype);
			}
			course.setCoursesy(course.getCoursesy()+1);
			course.setCoursepeople(course.getCoursepeople()-1);
			courseService.updateCourse(course);
			courseService.deleteCourseS(map,courseid);
			request.setAttribute("message", "课程退选成功");
			 return allcourse(request,coursetype);
		}
		
	}
}
