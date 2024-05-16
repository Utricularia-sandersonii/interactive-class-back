package com.code.classsystem.controller;

import com.code.classsystem.entity.Work;
import com.code.classsystem.service.WorkService;
import com.code.classsystem.vo.WorkInfoVo;
import com.code.classsystem.vo.WorkResultBinVo;
import com.code.classsystem.vo.WorkVo;
import com.code.core.entity.ResponseResult;
import com.code.core.util.ResponseResultUtil;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/work")
@Api(value = "作业接口", tags = "作业接口")
public class WorkController {

    @Autowired
    private WorkService workService;
    @ApiOperation(value = "创建作业接口", notes = "创建作业接口")
    @PostMapping("/createWork")
    public ResponseResult createWork(Work work) {
        workService.createWork(work);
        return ResponseResultUtil.renderSuccessMsg("创建作业成功！");
    }

    @ApiOperation(value = "查询作业接口", notes = "查询作业接口")
    @PostMapping("/queryWork")
    public ResponseResult queryWork(@RequestBody WorkVo workVo) {
        int page = workVo.getPage();
        int limit = workVo.getLimit();
        Work work=new Work();
        BeanUtils.copyProperties(workVo, work);
        List<Work> data = workService.queryWork(work, page, limit);
        return ResponseResultUtil.renderSuccess(data);
    }

    @RequestMapping("/listPage")
    public ResponseResult listPage(Work work,@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "20") int pageSize) {
        PageInfo<WorkInfoVo> workInfoVoList=workService.listPage(work,pageNum,pageSize);
        return ResponseResultUtil.renderSuccess(workInfoVoList, "退分页查找作业成功");
    }

    @RequestMapping("/queryMyWork")
    public ResponseResult queryMyWork(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "20") int pageSize) {
        List<Work>works=workService.queryMyWork(pageNum,pageSize);
        return ResponseResultUtil.renderSuccess(works);
    }

    @RequestMapping("/queryAllWork")
    public ResponseResult queryAllWork(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "20") int pageSize) {
        List<Work>works=workService.queryAllWork(pageNum,pageSize);
        return ResponseResultUtil.renderSuccess(works);
    }

    @RequestMapping("/queryWorkResult")
    public ResponseResult queryWorkResult(String courseId) {
        List<WorkResultBinVo>workResult=workService.queryWorkResult(courseId);
        return ResponseResultUtil.renderSuccess(workResult);
    }

    @RequestMapping("/delWork")
    public ResponseResult delWork(String workId) {
        workService.delWork(workId);
        return ResponseResultUtil.renderSuccess("");
    }



}

