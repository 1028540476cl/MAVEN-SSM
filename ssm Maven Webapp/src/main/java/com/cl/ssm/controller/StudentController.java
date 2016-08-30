package com.cl.ssm.controller;

import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.ssm.pojo.Student;
import com.cl.ssm.service.StudentService;
import com.cl.ssm.util.MD5;
@Controller  
@RequestMapping("student") 
public class StudentController {
	 	@Resource 
	    private StudentService studentService;
		public StudentService getStudentService() {
			return studentService;
		}
		public void setStudentService(StudentService studentService) {
			this.studentService = studentService;
		}
		
		/*
		 * 跳转到登陆界面
		 */
		@RequestMapping(params="tologin")
	    public String Login(HttpServletRequest request,HttpServletResponse response) throws Exception{
			return "index";
		}
		/*
		 * 退出登录
		 */
		@RequestMapping(params="loginout")
	    public String LoginOut(HttpServletRequest request,HttpServletResponse response) throws Exception{
			request.getSession().removeAttribute("student");
			return "index";
		}
		/*
		 * 登陆
		 */
		@RequestMapping(params="to")
	    public String toLogin(HttpServletRequest request,HttpServletResponse response) throws Exception{
			String studentid=request.getParameter("studentid");
			String psw = request.getParameter("password");
			if(studentid==null||studentid==""||psw==""||psw==null){
				return Login(request,response);
			}
			String check = request.getParameter("check");
			if("y".equals(check)){
				Cookie nameCookie = new Cookie("username", URLEncoder.encode(studentid, "UTF-8"));
				// nameCookie=URLEncoder.encode(nameCookie,"UTF-8");
				// 设置Cookie的有效期为1天
				nameCookie.setMaxAge(60 * 60 * 24);
				Cookie pwdCookie = new Cookie("password", URLEncoder.encode(psw, "UTF-8"));
				pwdCookie.setMaxAge(60 * 60*24);
				// 设置Cookie的有效期为1天
				response.addCookie(nameCookie);
				response.addCookie(pwdCookie);
			}
			Student student = studentService.getStudnetByName(studentid, psw);
			if(student==null){
				request.setAttribute("message", "用户名或者密码错误");
				//request.setAttribute("totalRe",0);
				return "error";
			}
			request.getSession().setAttribute("student", student);
	        return "check";
			}
}
