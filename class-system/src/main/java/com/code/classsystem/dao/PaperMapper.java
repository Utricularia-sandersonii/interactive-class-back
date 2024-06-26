package com.code.classsystem.dao;

import com.code.classsystem.entity.Paper;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.code.classsystem.vo.PaperInfoVo;
import com.code.classsystem.vo.PaperResultBinVo;

import java.util.List;


public interface PaperMapper extends BaseMapper<Paper> {
    List<PaperInfoVo> listPage(Paper paper);
    List<Paper> queryMyPaper(String userId);
    List<PaperResultBinVo> queryPaperResult(String courseId);

}
