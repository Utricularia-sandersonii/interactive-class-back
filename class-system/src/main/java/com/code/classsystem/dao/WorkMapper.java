package com.code.classsystem.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.code.classsystem.entity.Work;
import com.code.classsystem.vo.WorkInfoVo;
import com.code.classsystem.vo.WorkResultBinVo;

import java.util.List;


public interface WorkMapper extends BaseMapper<Work> {
    List<WorkInfoVo> listPage(Work work);
    List<Work> queryMyWork(String userId);
    List<WorkResultBinVo> queryWorkResult(String courseId);

}
