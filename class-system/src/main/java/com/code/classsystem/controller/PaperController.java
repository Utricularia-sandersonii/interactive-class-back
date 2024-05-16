package com.code.classsystem.controller;

import com.code.classsystem.dao.ClassMapper;
import com.code.classsystem.dao.CourseMapper;
import com.code.classsystem.entity.Class;
import com.code.classsystem.entity.Course;
import com.code.classsystem.entity.Paper;
import com.code.classsystem.service.PaperService;
import com.code.classsystem.vo.PagerVo;
import com.code.classsystem.vo.PaperInfoVo;
import com.code.classsystem.vo.PaperResultBinVo;
import com.code.classsystem.vo.PaperVo;
import com.code.core.entity.ResponseResult;
import com.code.core.enums.ErrorEnum;
import com.code.core.util.ResponseResultUtil;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/paper")
@Api(value = "试卷接口", tags = "试卷接口")
public class PaperController {

    @Autowired
    private PaperService paperService;

    @Autowired
    private ClassMapper classMapper;

    @Autowired
    private CourseMapper courseMapper;

    @ApiOperation(value = "创建试卷接口", notes = "创建试卷接口")
    @PostMapping("/createPaper")
    public ResponseResult createPaper(Paper paper) {
        paperService.createPaper(paper);
        return ResponseResultUtil.renderSuccessMsg("创建试卷成功！");
    }


    @ApiOperation(value = "创建试卷接口", notes = "创建试卷接口")
    @PostMapping("/WebCreatePaper")
    public ResponseResult WebCreatePaper(PaperInfoVo pagerVo) {

        Class tempClass = new Class();
        Course course = new Course();

        tempClass.setClassName(pagerVo.getClassName());
        course.setCourseName(pagerVo.getCourseName());


        String classId = classMapper.selectOne(tempClass).getId();
        String courseId = courseMapper.selectOne(course).getId();

        if (classId != null || courseId != null){
            Paper paper = pagerVo;
            paper.setClassId(classId);
            paper.setCourseId(courseId);
            paperService.createPaper(paper);
            return ResponseResultUtil.renderSuccessMsg("创建试卷成功！");
        }

        return ResponseResultUtil.renderError(ErrorEnum.USER_PASSWORD_ERROR.setMsg("添加失败"));
    }

    @ApiOperation(value = "查询试卷接口", notes = "查询试卷接口")
    @PostMapping("/queryPaper")
    public ResponseResult queryPaper(@RequestBody PaperVo paperVo) {
        int page = paperVo.getPage();
        int limit = paperVo.getLimit();
        Paper paper=new Paper();
        BeanUtils.copyProperties(paperVo, paper);
        List<Paper> data = paperService.queryPaper(paper, page, limit);
        return ResponseResultUtil.renderSuccess(data);
    }

    @RequestMapping("/listPage")
    public ResponseResult listPage(Paper paper,@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "20") int pageSize) {
        PageInfo<PaperInfoVo> paperInfoVoList=paperService.listPage(paper,pageNum,pageSize);
        return ResponseResultUtil.renderSuccess(paperInfoVoList, "退分页查找试卷成功");
    }

    @RequestMapping("/queryMyPaper")
    public ResponseResult queryMyPaper(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "20") int pageSize) {
        List<Paper>papers=paperService.queryMyPaper(pageNum,pageSize);
        return ResponseResultUtil.renderSuccess(papers);
    }

    @RequestMapping("/queryAllPaper")
    public ResponseResult queryAllPaper(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "20") int pageSize) {
        List<Paper>papers=paperService.queryAllPaper(pageNum,pageSize);
        return ResponseResultUtil.renderSuccess(papers);
    }

    @RequestMapping("/queryPaperResult")
    public ResponseResult queryPaperResult(String courseId) {
        List<PaperResultBinVo>paperResult=paperService.queryPaperResult(courseId);
        return ResponseResultUtil.renderSuccess(paperResult);
    }

    @RequestMapping("/delPaper")
    public ResponseResult delPaper(String paperId) {
        paperService.delPaper(paperId);
        return ResponseResultUtil.renderSuccess("");
    }



}

