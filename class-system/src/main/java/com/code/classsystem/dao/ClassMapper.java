package com.code.classsystem.dao;

import com.code.classsystem.entity.Class;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.code.classsystem.entity.Notice;
import com.code.classsystem.vo.ClassVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface ClassMapper extends BaseMapper<Class> {

    Class getClassByClassCode(String classCode);

    List<Class> queryAll();

    Class getClassByClassNameAndCurId(@Param("className") String className, @Param("userId") String userId);

    List<ClassVo> listPage(Class cla);


}
