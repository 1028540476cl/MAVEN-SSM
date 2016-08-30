package com.cl.ssm.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.cl.ssm.dao.CourseMapper;
import com.cl.ssm.pojo.Course;

@Service("courseService")
public class CourseService {
	@Resource 
	private CourseMapper courseDao;
	
	/*
	 * 分页查看各类型的全部课程
	 */
	public List<Course> selectAllPage(Map<String,Object>map){
		return courseDao.pageAll(map);
	}
	/*
	 * 查看各类型课程的总数
	 */
	public int getTotal(Map<String,Object>map){
		return courseDao.getTotal(map);
	}
	/*
	 * 分页查看已选的课程
	 */
	public List<Course> findCourse(Map<String,Object>map){
		return courseDao.findCourse(map);
	}
	/*
	 * 记录已选课程总数
	 */
	public int findCourseTotal(Map<String,Object> map){
		return courseDao.findCoursetotal(map);
	}
	/*
	 * 查看具体的一个课程
	 */
	public Course oneCourse(int id){
		return courseDao.oneCourse(id);
	}
	/*
	 * 退课
	 */
	public int deleteCourseS(Map<String,Object> map,int id){
		if(courseDao.deleteCourseS(map)!=0){//不等于0代表删除表间的联系成功
			return courseDao.deleteByPrimaryKey(id);
		}
		return 0;
	}
	/**
	 * 退课后对课程进行更新
	 */
	public int updateCourse(Course course){
		return courseDao.updateCourse(course);
	}

}
