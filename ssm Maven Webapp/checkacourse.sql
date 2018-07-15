/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.6.22-log : Database - checkacourse
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`checkacourse` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `checkacourse`;

/*Table structure for table `t_course` */

DROP TABLE IF EXISTS `t_course`;

CREATE TABLE `t_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程编号',
  `coursename` varchar(50) DEFAULT NULL COMMENT '课程名称',
  `courseclass` varchar(50) DEFAULT NULL COMMENT '课程开课单位',
  `coursetime` varchar(50) DEFAULT NULL COMMENT '课程上课时间',
  `coursebord` float DEFAULT NULL COMMENT '课程学分',
  `coursecount` int(11) DEFAULT NULL COMMENT '课程总容量',
  `coursesy` int(11) DEFAULT NULL COMMENT '课程剩余容量',
  `coursepeople` int(11) DEFAULT NULL COMMENT '课程选课人数',
  `cotein` varchar(500) DEFAULT NULL COMMENT '课程需求',
  `coursetype` varchar(50) DEFAULT NULL COMMENT '课程类型',
  `type` varchar(50) DEFAULT NULL COMMENT '选完课程后之前的类型',
  `courseteacherid` int(11) DEFAULT NULL COMMENT '跟teacher表的外键',
  PRIMARY KEY (`id`),
  KEY `courseteacherid` (`courseteacherid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `t_course` */

insert  into `t_course`(`id`,`coursename`,`courseclass`,`coursetime`,`coursebord`,`coursecount`,`coursesy`,`coursepeople`,`cotein`,`coursetype`,`type`,`courseteacherid`) values (1,'摄影技术','理学院','周三',1.5,130,25,105,'无','6',NULL,2),(2,'营养健康跟美容','园林与艺术学院','周三',1.5,120,18,102,'无','6',NULL,NULL),(3,'java','软件学院','周一',2,50,10,40,'无','2',NULL,NULL),(4,'javaweb','软件学院','周一',2,50,3,47,'无','2',NULL,NULL),(5,'足球','体育学院','周一',1.5,130,25,105,'无','1',NULL,NULL),(6,'篮球','体育学院','周一',1.5,80,8,72,'无','1',NULL,NULL),(7,'民俗体育与文化','体育学院','周五',1.5,90,81,9,'无','6',NULL,NULL),(8,'绘画与勘查','园林与艺术学院','周五',1.5,50,41,9,'有一定的绘画的基础','6',NULL,NULL),(9,'uml','软件学院','周二',1.5,50,0,50,'无','2',NULL,NULL);

/*Table structure for table `t_course_student` */

DROP TABLE IF EXISTS `t_course_student`;

CREATE TABLE `t_course_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `studentsid` int(11) DEFAULT NULL COMMENT '多对多学生的外键',
  `courseid` int(11) DEFAULT NULL COMMENT '多对多的课程外键',
  PRIMARY KEY (`id`),
  KEY `studentid` (`studentsid`),
  KEY `courseid` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_course_student` */

/*Table structure for table `t_student` */

DROP TABLE IF EXISTS `t_student`;

CREATE TABLE `t_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `studentid` varchar(20) DEFAULT NULL COMMENT '学生学号',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `psw` varchar(50) DEFAULT NULL COMMENT '密码',
  `studentclass` varchar(50) DEFAULT NULL COMMENT '所属班级',
  `date` varchar(50) DEFAULT NULL COMMENT '出生时间',
  `sex` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_student` */

insert  into `t_student`(`id`,`studentid`,`name`,`psw`,`studentclass`,`date`,`sex`) values (1,'20131752','陈林','123456','软件1302','1994-09-28','男'),(2,'20131751','陈和','123456','软件1302','1994-02-08','男');

/*Table structure for table `t_student_teacher` */

DROP TABLE IF EXISTS `t_student_teacher`;

CREATE TABLE `t_student_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上课表的id',
  `studentsid` int(11) DEFAULT NULL COMMENT '上课表中的学生对应的id',
  `teacherid` int(11) DEFAULT NULL COMMENT '上课表中老师对应的id',
  `address` varchar(50) DEFAULT NULL COMMENT '上课表中上课的地点',
  PRIMARY KEY (`id`),
  KEY `studentid` (`studentsid`),
  KEY `teacherid` (`teacherid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_student_teacher` */

insert  into `t_student_teacher`(`id`,`studentsid`,`teacherid`,`address`) values (1,1,1,NULL),(2,1,2,NULL);

/*Table structure for table `t_teacher` */

DROP TABLE IF EXISTS `t_teacher`;

CREATE TABLE `t_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `teacherid` varchar(50) DEFAULT NULL COMMENT '老师编号',
  `name` varchar(20) DEFAULT NULL COMMENT '老师名字',
  `nameclass` varchar(50) DEFAULT NULL COMMENT '老师所属单位',
  `picture` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_teacher` */

insert  into `t_teacher`(`id`,`teacherid`,`name`,`nameclass`,`picture`) values (1,'1001001','柳青','软件学院',NULL),(2,'1002001','柳红','理学院',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
