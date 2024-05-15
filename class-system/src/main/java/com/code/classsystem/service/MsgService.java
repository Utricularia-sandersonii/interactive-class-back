package com.code.classsystem.service;

import com.code.classsystem.entity.Msg;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;


public interface MsgService extends IService<Msg> {

    List<Msg> listLastN(String classId, int n);
}
