package com.code.classsystem.controller;


import com.code.classsystem.entity.HomeWork;
import com.code.classsystem.service.HomeWorkService;
import com.code.classsystem.vo.HomeWorkVo;
import com.code.core.entity.ResponseResult;
import com.code.core.util.ResponseResultUtil;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;


@RestController
@RequestMapping("/homework")
@Api(value = "课后已提交作业接口", tags = "课后已提交作业接口")
public class HomeWorkController {
    @Autowired
    private HomeWorkService homeWorkService;

    @ApiOperation(value = "创建已提交作业接口", notes = "创建已提交作业接口")
    @PostMapping("/createHomeWork")
    public ResponseResult createHomeWork(@RequestBody @Valid HomeWork homeWork, BindingResult bindingResult) {
        homeWorkService.addHomeWork(homeWork);
        return ResponseResultUtil.renderSuccess("创建已提交作业成功！");
    }

    @ApiOperation(value = "更新已提交作业接口", notes = "更新已提交作业接口")
    @PostMapping("/updateHomework")
    public ResponseResult updateHomework(@RequestBody @Valid HomeWork homeWork) {
        homeWorkService.updateById(homeWork);
        return ResponseResultUtil.renderSuccess("更新已提交作业成功！");
    }

    @ApiOperation(value = "删除已提交作业接口", notes = "删除已提交作业接口")
    @PostMapping("/deleteHomework")
    public ResponseResult deleteHomework(@RequestParam("ids") List<String> ids) {
        homeWorkService.deleteBatchIds(ids);
        return ResponseResultUtil.renderSuccess("删除已提交作业成功！");
    }


    @ApiOperation(value = "根据id查看已提交作业", notes = "根据id查看已提交作业")
    @GetMapping("/getDetailById/{id}")
    public ResponseResult getDetailById(@PathVariable("id") String id) {
        HomeWork homeWork = homeWorkService.selectById(id);
        return ResponseResultUtil.renderSuccess(homeWork);
    }

    @ApiOperation(value = "分页查询已提交作业", notes = "分页查询已提交作业")
    @GetMapping("/listPage")
    public ResponseResult listPage(HomeWork homeWork, @RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "20") int pageSize) {
        PageInfo<HomeWorkVo> homeWorkVoPageInfo = homeWorkService.listPage(homeWork, pageNum, pageSize);
        return ResponseResultUtil.renderSuccess(homeWorkVoPageInfo);
    }
}

