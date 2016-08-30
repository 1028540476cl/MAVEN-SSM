package com.cl.ssm.dao;

import java.util.List;
import java.util.Map;

import com.cl.ssm.pojo.Course;
public interface CourseMapper {
    /*int deleteByPrimaryKey(Integer id);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);*/

	List<Course> pageAll(Map<String,Object> map);
	
	int	getTotal(Map<String,Object> map);
	
	List<Course> findCourse(Map<String,Object>map);
	 
	int findCoursetotal(Map<String,Object> map);
	
	Course oneCourse(int id);
	
	int deleteByPrimaryKey(Integer id);
	
	int deleteCourseS(Map<String,Object> map);
	
	int updateCourse(Course course);
}