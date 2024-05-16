package com.code.classsystem.service;

import com.baomidou.mybatisplus.service.IService;
import com.code.classsystem.entity.Work;
import com.code.classsystem.vo.WorkInfoVo;
import com.code.classsystem.vo.WorkResultBinVo;
import com.github.pagehelper.PageInfo;

import java.util.List;


public interface WorkService extends IService<Work> {
    boolean createWork(Work work);

    List<Work> queryWork(Work work, int page, int limit);
    PageInfo<WorkInfoVo> listPage(Work work, int pageNum, int pageSize);

    List<Work> queryAllWork(int pageNum, int pageSize);

    List<Work> queryMyWork(int pageNum, int pageSize);

    List<WorkResultBinVo> queryWorkResult(String courseId);

    boolean delWork(String workId);
}
