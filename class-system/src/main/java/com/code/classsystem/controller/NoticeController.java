package com.code.classsystem.controller;


import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSONObject;
import com.code.classsystem.common.shiro.util.ShiroUtils;
import com.code.classsystem.entity.Class;
import com.code.classsystem.entity.Course;
import com.code.classsystem.entity.Notice;
import com.code.classsystem.service.ClassService;
import com.code.classsystem.service.ClassUserService;
import com.code.classsystem.service.CourseService;
import com.code.classsystem.service.NoticeService;
import com.code.classsystem.vo.NoticeVo;
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
    @ApiOperation(value = "添加通知接口", notes = "添加通知接口")
    @PostMapping("/addNotice")
    public ResponseResult addNotice(Notice notice) {
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

