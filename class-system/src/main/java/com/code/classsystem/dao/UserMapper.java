package com.code.classsystem.dao;

import com.code.classsystem.entity.User;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.code.classsystem.vo.UserInfoVo;

import java.util.List;


public interface UserMapper extends BaseMapper<User> {

    List<UserInfoVo> listPage(User user);

    List<UserInfoVo> findAll(User user);
    UserInfoVo getUserInfoByUserId(String userId);
}
