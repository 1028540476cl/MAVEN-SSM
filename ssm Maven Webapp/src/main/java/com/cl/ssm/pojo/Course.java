package com.cl.ssm.pojo;

import java.util.List;

public class Course {
    private Integer id;

    private String coursename;

    private String courseclass;

    private String coursetime;

    private Float coursebord;

    private Integer coursecount;

    private Integer coursesy;

    private Integer coursepeople;

    private String cotein;

    private String coursetype;

    private String type;

    private Integer courseteacherid;
    
    private List<Student> students;
    
    private Teacher teacher;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCoursename() {
        return coursename;
    }

    public void setCoursename(String coursename) {
        this.coursename = coursename == null ? null : coursename.trim();
    }

    public String getCourseclass() {
        return courseclass;
    }

    public void setCourseclass(String courseclass) {
        this.courseclass = courseclass == null ? null : courseclass.trim();
    }

    public String getCoursetime() {
        return coursetime;
    }

    public void setCoursetime(String coursetime) {
        this.coursetime = coursetime == null ? null : coursetime.trim();
    }

    public Float getCoursebord() {
        return coursebord;
    }

    public void setCoursebord(Float coursebord) {
        this.coursebord = coursebord;
    }

    public Integer getCoursecount() {
        return coursecount;
    }

    public void setCoursecount(Integer coursecount) {
        this.coursecount = coursecount;
    }

    public Integer getCoursesy() {
        return coursesy;
    }

    public void setCoursesy(Integer coursesy) {
        this.coursesy = coursesy;
    }

    public Integer getCoursepeople() {
        return coursepeople;
    }

    public void setCoursepeople(Integer coursepeople) {
        this.coursepeople = coursepeople;
    }

    public String getCotein() {
        return cotein;
    }

    public void setCotein(String cotein) {
        this.cotein = cotein == null ? null : cotein.trim();
    }

    public String getCoursetype() {
        return coursetype;
    }

    public void setCoursetype(String coursetype) {
        this.coursetype = coursetype == null ? null : coursetype.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Integer getCourseteacherid() {
        return courseteacherid;
    }

    public void setCourseteacherid(Integer courseteacherid) {
        this.courseteacherid = courseteacherid;
    }

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	@Override
	public String toString() {
		return "Course [id=" + id + ", coursename=" + coursename
				+ ", courseclass=" + courseclass + ", coursetime=" + coursetime
				+ ", coursebord=" + coursebord + ", coursecount=" + coursecount
				+ ", coursesy=" + coursesy + ", coursepeople=" + coursepeople
				+ ", cotein=" + cotein + ", coursetype=" + coursetype
				+ ", type=" + type + ", courseteacherid=" + courseteacherid
				+ ", students=" + students + ", teacher=" + teacher + "]";
	}
	
    
}