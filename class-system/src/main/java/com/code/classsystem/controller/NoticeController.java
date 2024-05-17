package com.code.classsystem.controller;


import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSONObject;
import com.code.classsystem.common.shiro.util.ShiroUtils;
import com.code.classsystem.entity.*;
import com.code.classsystem.entity.Class;
import com.code.classsystem.service.*;
import com.code.classsystem.vo.NoticeVo;
import com.code.classsystem.vo.PaperVo;
import com.code.classsystem.vo.WorkVo;
import com.code.core.entity.ResponseResult;
import com.code.core.util.ResponseResultUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/notice")
@Api(value = "通知接口", tags = "通知接口")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;
    @Autowired
    private ClassUserService classUserService;
    @Autowired
    private ClassService classService;
    @Autowired
    private CourseService courserService;
    @Autowired
    private WorkService workService;
    @Autowired
    private PaperService paperService;
    @ApiOperation(value = "添加通知接口", notes = "添加通知接口")
    @PostMapping("/addNotice")
    public ResponseResult addNotice(Notice notice) {
        notice.setPublishUserId(ShiroUtils.getUserId());
        noticeService.addNotice(notice);
        return ResponseResultUtil.renderSuccessMsg("创建通知成功！");
    }
    @ApiOperation(value = "作业提醒接口", notes = "作业提醒接口")
    @PostMapping("/addWorkRemind")
    public ResponseResult addWorkRemind(WorkVo workVo) {
        Work work = workService.selectById(workVo.getId());
        Notice notice = new Notice();
        notice.setNoticeTitle("作业提醒通知");
        notice.setNoticeContent("请尽快完成作业‘"+work.getWorkTitle()+"’");

        notice.setClassId(work.getClassId());
        notice.setCourseId(work.getCourseId());
        notice.setPublishUserId(ShiroUtils.getUserId());
        noticeService.addNotice(notice);
        return ResponseResultUtil.renderSuccessMsg("创建通知成功！");
    }
    @ApiOperation(value = "试卷提醒接口", notes = "试卷提醒接口")
    @PostMapping("/addPaperRemind")
    public ResponseResult addPaperRemind(PaperVo paperVo) {
        Paper paper = paperService.selectById(paperVo.getId());
        Notice notice = new Notice();
        notice.setNoticeTitle("试卷提醒通知");
        notice.setNoticeContent("请尽快完成试卷‘"+paper.getPaperName()+"’");
        notice.setClassId(paper.getClassId());
        notice.setCourseId(paper.getCourseId());
        notice.setPublishUserId(ShiroUtils.getUserId());
        noticeService.addNotice(notice);
        return ResponseResultUtil.renderSuccessMsg("创建通知成功！");
    }

    @ApiOperation(value = "查询通知接口", notes = "查询通知接口")
    @PostMapping("/queryNotice")
    public ResponseResult queryNotice(@RequestBody NoticeVo noticeVo) {
        int page = noticeVo.getPage();
        int limit = noticeVo.getLimit();
        String currentUserId = noticeVo.getCurrentUserId();
        //获取用户所在所有班级
        List<Class> classes = classUserService.listClassByUserId(currentUserId);
        List<Notice> data2 = new ArrayList<>();
        //获取所在班级的所有通知提醒
        for (Class c : classes) {
            Notice notice = new Notice();
            notice.setClassId(c.getId());

            for (Notice n : noticeService.queryNotice(notice, page, limit)) {
                Class aClass = classService.selectById(n.getClassId());
                if (aClass!=null){
                    n.setClassname(aClass.getClassName());
                }
                Course course = courserService.selectById(n.getCourseId());
                if (course!=null){
                    n.setCoursename(course.getCourseName());
                }

                data2.add(n);
            }
        }

        return ResponseResultUtil.renderSuccess(data2);
    }

}

