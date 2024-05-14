package com.code.classsystem.dao;

import com.code.classsystem.entity.CourseResource;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;


public interface CourseResourceMapper extends BaseMapper<CourseResource> {
    List<CourseResource> queryMyCourse(String userId);
}
