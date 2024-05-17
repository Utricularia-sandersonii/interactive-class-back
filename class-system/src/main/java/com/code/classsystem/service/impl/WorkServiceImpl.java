package com.code.classsystem.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.code.classsystem.common.shiro.util.ShiroUtils;
import com.code.classsystem.dao.WorkMapper;
import com.code.classsystem.entity.Work;
import com.code.classsystem.service.WorkService;
import com.code.classsystem.vo.WorkInfoVo;
import com.code.classsystem.vo.WorkResultBinVo;
import com.code.core.util.DateUtils;
import com.code.core.util.UUIDUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.util.List;


@Service
public class WorkServiceImpl extends ServiceImpl<WorkMapper, Work> implements WorkService {

    @Autowired
    private WorkMapper workMapper;
    @Override
    public boolean createWork(Work work) {
        String id= UUIDUtil.getUUid();
        String userId=ShiroUtils.getUserId();
        String curTime= DateUtils.getTimeStr("yyyy-mm-dd hh:mm:ss");
        work.setPublishTime(curTime);
        work.setId(id);
        work.setPublishUserId(userId);
        return this.insert(work);
    }

    @Override
    public List<Work> queryWork(Work work, int page, int limit) {
        Page<Work> workPage=new Page<>(page,limit);
        EntityWrapper<Work> wrapper=new EntityWrapper<>();
        if(work.getId()!=null){
            wrapper.eq("id",work.getId());
        }
        if (work.getCourseId()!=null){
            wrapper.eq("course_id",work.getCourseId());
        }
        wrapper.orderBy("publish_time",false);
        List<Work>list=this.selectPage(workPage,wrapper).getRecords();
        return list;
    }

    @Override
    public PageInfo<WorkInfoVo> listPage(Work work,int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        work.setPublishUserId(ShiroUtils.getUserId());
        List<WorkInfoVo> workInfoVoList=workMapper.listPage(work);
        return new PageInfo<>(workInfoVoList);
    }

    @Override
    public List<Work> queryAllWork(int pageNum, int pageSize) {
        Page<Work> workPage=new Page<>(pageNum,pageSize);
        List<Work>list=this.selectPage(workPage,null).getRecords();
        return list;
    }

    @Override
    public List<Work> queryMyWork(int pageNum, int pageSize) {
        String userId=ShiroUtils.getUserId();
        PageHelper.startPage(pageNum, pageSize);
        List<Work> works=workMapper.queryMyWork(userId);
        return new PageInfo<Work>(works).getList();
    }

    @Override
    public List<WorkResultBinVo> queryWorkResult(String courseId) {
        List<WorkResultBinVo> workResultBinVos= workMapper.queryWorkResult(courseId);
        double total_rate=0.0;
        DecimalFormat df = new DecimalFormat("#.00");
        for(int i=0;i<workResultBinVos.size();i++){
            double rate=Double.parseDouble(workResultBinVos.get(i).getGoodRate());
            total_rate+=rate;
        }
        for(int i=0;i<workResultBinVos.size();i++){
            double rate2=Double.parseDouble(workResultBinVos.get(i).getGoodRate());
            String result=df.format(rate2/total_rate);
            workResultBinVos.get(i).setGoodRate(result);
        }
        return workResultBinVos;
    }

    @Override
    public boolean delWork(String workId) {

        return false;
    }
}
