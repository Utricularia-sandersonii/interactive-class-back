package com.code.classsystem.service.impl;

import com.code.classsystem.common.shiro.util.ShiroUtils;
import com.code.classsystem.entity.Class;
import com.code.classsystem.entity.Course;
import com.code.classsystem.dao.CourseMapper;
import com.code.classsystem.entity.CourseResource;
import com.code.classsystem.entity.User;
import com.code.classsystem.service.ClassCourseService;
import com.code.classsystem.service.CourseResourceService;
import com.code.classsystem.util.DateUtils;
import com.code.classsystem.vo.*;
import com.code.classsystem.service.ClassService;
import com.code.classsystem.service.CourseService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.code.core.enums.ErrorEnum;
import com.code.core.exception.BusinessException;
import com.code.core.util.StringUtils;
import com.code.core.util.UUIDUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author coder
 * @since 2020-04-18
 */
@Service
public class CourseServiceImpl extends ServiceImpl<CourseMapper, Course> implements CourseService {

    @Autowired
    private ClassService classService;
    @Autowired
    private CourseMapper courseMapper;
    @Autowired
    private CourseResourceService courseResourceService;
    @Autowired
    private ClassCourseService classCourseService;

    @Override
    public void addCourse(CourseVo courseVo) {
        List<String> classNameList = courseVo.getClassNameList();
        Assert.notNull(classNameList, "班级名称无效");
        String[] classNames = classNameList.toArray(new String[classNameList.size()]);
        List<Class> classes = classService.getClassByClassName(classNames);
        Assert.notNull(classes, "班级名称无效");
        Course course = new Course();
        course.setCreatedUserId(courseVo.getCreatedUserId());
        course.setCourseName(courseVo.getCourseName());
        course.setBeginTime(courseVo.getBeginTime());
        course.setEndTime(courseVo.getEndTime());
        course.setCourseIntroduce(courseVo.getCourseIntroduce());
        String courseId = UUIDUtil.getRandomUUID();
        course.setId(courseId);

        int studentNum = 0;
        for (Class clazz : classes) {
            classCourseService.save(clazz.getId(), courseId);
            studentNum += clazz.getClassNum();
        }
        course.setStudentNum(studentNum);
        //添加课程
        this.insert(course);

    }

    @Override
    public List<CourseAndClass> queryCourseInfo(String userId) {
        List<CourseAndClass> courseAndClassList = courseMapper.mcourseInfo(userId);
        return courseAndClassList;
    }

    @Override
    public PageInfo<CourseInfoVo> listPage(Course search, int pageNum, int pageSize) {
        if (search == null) {
            search = new Course();
        }
        User userEntity = ShiroUtils.getUserEntity();

        Integer roleId = userEntity.getRoleId();
        if (roleId == 1) {
            throw new BusinessException(ErrorEnum.UNAUTHORIZED.setMsg("权限不够，禁止访问"));
        } else if (roleId == 2) {
            String userId = userEntity.getId();
            search.setCreatedUserId(userId);
        }
        PageHelper.startPage(pageNum, pageSize);
        List<CourseInfoVo> userInfoVos = courseMapper.listPage(search);
        return new PageInfo<>(userInfoVos);
    }

    @Override
    public void addCourseInfoVo(CourseInfoVo courseInfoVo) {
        List<String> classNameList = courseInfoVo.getClassNameList();
        Assert.notNull(classNameList, "班级名称不能为空");
        String[] array = classNameList.toArray(new String[classNameList.size()]);
        List<Class> classes = classService.getClassByClassName(array);
        List<CourseResource> courseResources = new ArrayList<>();

        Assert.notNull(classes, "班级名称无效");

        Course course = new Course();
        BeanUtils.copyProperties(courseInfoVo, course);
        String userId = ShiroUtils.getUserId();
        course.setCreatedUserId(userId);
        String courseId = UUIDUtil.getRandomUUID();
        course.setId(courseId);
        int studentNum = 0;
        for (Class clazz : classes) {
            classCourseService.save(clazz.getId(), courseId);
            studentNum += clazz.getClassNum();
        }
        course.setStudentNum(studentNum);
        //添加课程
        this.insert(course);

        //存储课程资源
        List<CourseResource> pptResources = courseInfoVo.getPptResources();
        if (pptResources != null) {
            courseResources.addAll(pptResources);
        }
        List<CourseResource> videoResources = courseInfoVo.getVideoResources();
        if (videoResources != null) {
            courseResources.addAll(videoResources);
        }

        if (!CollectionUtils.isEmpty(courseResources)) {
            for (CourseResource courseResource : courseResources) {
                if (courseResource == null || courseResource.getResourcePath() == null) {
                    continue;
                }
                String resourceName = getResourceName(courseResource.getResourcePath());
                courseResource.setCourseResourceName(resourceName);
                courseResource.setCourseId(courseId);
                courseResource.setUserId(userId);
                courseResource.setCreateTime(DateUtils.getCurTimeStr());
                courseResourceService.insert(courseResource);
            }
        }


    }

    private String getResourceName(String resourcePath) {
        String resourceName = null;
        if (resourcePath.contains("_")) {
            resourceName = resourcePath.substring(resourcePath.lastIndexOf("_") + 1);
        } else {
            resourceName = resourcePath.substring(resourcePath.lastIndexOf("/") + 1);
        }
        return resourceName;
    }

    @Override
    public void deleteCourse(String[] ids) {
        Arrays.stream(ids).forEach(id -> {
            this.deleteById(id);
            courseResourceService.deleteByCourseId(id);
        });
    }

    @Override
    public CourseInfoVo getDetailById(String id) {
        return courseMapper.getDetailById(id);
    }

    @Override
    public void updateCourse(CourseInfoVo courseInfoVo) {
        List<String> classNameList = courseInfoVo.getClassNameList();
        Assert.notNull(classNameList, "班级名称不能为空");
        String[] array = classNameList.toArray(new String[classNameList.size()]);
        List<Class> classes = classService.getClassByClassName(array);
        List<CourseResource> courseResources = new ArrayList<>();
        Assert.notNull(classes, "班级名称无效");
        Course course = new Course();
        BeanUtils.copyProperties(courseInfoVo, course);
        String userId = ShiroUtils.getUserId();
        course.setCreatedUserId(userId);
        this.updateById(course);
        for (Class clazz : classes) {
            classCourseService.save(clazz.getId(), course.getId());
        }
        //存储课程资源
        List<CourseResource> pptResources = courseInfoVo.getPptResources();
        if (pptResources != null) {
            courseResources.addAll(pptResources);
        }
        List<CourseResource> videoResources = courseInfoVo.getVideoResources();
        if (videoResources != null) {
            courseResources.addAll(videoResources);
        }
        if (!CollectionUtils.isEmpty(courseResources)) {
            for (CourseResource courseResource : courseResources) {
                if (courseResource == null || courseResource.getResourcePath() == null) {
                    continue;
                }
                String resourceName = getResourceName(courseResource.getResourcePath());
                courseResource.setCourseResourceName(resourceName);
                String courseId = course.getId();
                courseResource.setCourseId(courseId);
                courseResource.setUserId(userId);
                courseResource.setCreateTime(DateUtils.getCurTimeStr());
                String courseResourceId = courseResource.getId();
                if (StringUtils.isNull(courseResourceId)) {
                    courseResourceService.insert(courseResource);
                } else {
                    courseResourceService.updateById(courseResource);
                }

            }
        }
    }

    @Override
    public List queryTeachCourse(String userId) {
        List<TeacherCourseVo> courseAndClassList = courseMapper.queryTeachCourse(userId);
        return courseAndClassList;
    }
}
