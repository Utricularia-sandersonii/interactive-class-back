package com.code.classsystem.service;

import com.code.classsystem.entity.UserSign;
import com.baomidou.mybatisplus.service.IService;
import com.code.classsystem.vo.SignVo;


public interface UserSignService extends IService<UserSign> {
    boolean doSign(UserSign userSign);
    SignVo querySignInfo(UserSign userSign);
}
