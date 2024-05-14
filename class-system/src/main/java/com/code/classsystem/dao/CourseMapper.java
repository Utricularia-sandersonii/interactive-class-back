package com.code.classsystem.dao;

import com.code.classsystem.entity.Class;
import com.code.classsystem.entity.Course;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.code.classsystem.vo.CourseAndClass;
import com.code.classsystem.vo.CourseInfoVo;
import com.code.classsystem.vo.TeacherCourseVo;

import java.util.List;


public interface CourseMapper extends BaseMapper<Course> {

    List<CourseAndClass> mcourseInfo(String userId);

    List<Course> queryAll();

    List<TeacherCourseVo>queryTeachCourse(String userId);

    List<CourseInfoVo> listPage(Course course);

    CourseInfoVo getDetailById(String id);
}
