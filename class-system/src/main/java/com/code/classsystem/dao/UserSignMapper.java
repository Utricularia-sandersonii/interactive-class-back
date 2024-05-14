package com.code.classsystem.dao;

import com.code.classsystem.entity.UserSign;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.code.classsystem.vo.ClassStudentVo;
import com.code.classsystem.vo.SignResult;
import com.code.classsystem.vo.SignVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author coder
 * @since 2020-04-05
 */
public interface UserSignMapper extends BaseMapper<UserSign> {
    SignVo querySignInfo(UserSign userSign);

    UserSign queryUserSign(UserSign userSign);

    List<SignResult> queryByClazzAndCourse(ClassStudentVo classStudentVo);

    UserSign findById(@Param("id") String id);

    Integer update(UserSign userSign);

}
