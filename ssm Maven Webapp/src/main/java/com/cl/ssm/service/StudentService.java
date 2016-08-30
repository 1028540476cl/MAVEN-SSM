package com.cl.ssm.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.ssm.dao.StudentMapper;
import com.cl.ssm.pojo.Student;

@Service("studentService")
public class StudentService {
	 @Resource  
	private StudentMapper StudentDao;
	public Student getStudnetByName(String studentid,String password){
		if(StudentDao.getStudentByName(studentid).getPsw().equals(password)){
			return StudentDao.getStudentByName(studentid);
		}
		return null;
	}

}
