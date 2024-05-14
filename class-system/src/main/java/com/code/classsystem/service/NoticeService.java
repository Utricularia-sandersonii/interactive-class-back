package com.code.classsystem.service;

import com.code.classsystem.entity.Notice;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;


public interface NoticeService extends IService<Notice> {
    boolean addNotice (Notice notice);

    List<Notice> queryNotice(Notice notice, int page, int limit);
}
