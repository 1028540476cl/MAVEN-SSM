/*package test;
import javax.annotation.Resource;  

import org.apache.log4j.Logger;    
import org.junit.Test;  
import org.junit.runner.RunWith;   
import org.springframework.test.context.ContextConfiguration;  
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner; 
import com.cl.ssm.pojo.Student;
import com.cl.ssm.service.StudentService;
  
@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})  
  
public class TestMyBatis {  
    @Resource  
    private StudentService studentService = null; 
  
    @Test  
    public void test1() {  
        Student student = studentService.getStudnetByName("20131752", "123456");  
      System.out.println(student);  
    }  
} */