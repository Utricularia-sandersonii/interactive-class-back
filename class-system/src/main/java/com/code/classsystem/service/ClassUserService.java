package com.code.classsystem.service;

import com.code.classsystem.entity.Class;
import com.code.classsystem.entity.ClassStudent;
import com.code.classsystem.entity.ClassUser;
import com.baomidou.mybatisplus.service.IService;
import com.code.classsystem.entity.User;
import com.code.classsystem.vo.ClassStudentVo;

import java.util.List;


public interface ClassUserService extends IService<ClassUser> {

    void saveClassUser(String classId, String userId);

    List<Class> listClassByUserId(String userId);

    void joinClass(String classCode);

    List<User> showClassUsers(String classId);

    List<ClassStudent> queryStuStatus(ClassStudentVo classStudentVo);

    List<Class> listTeacherClasses(String teacherId);
}
