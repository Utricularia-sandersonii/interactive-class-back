package com.code.classsystem.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;


public class Work implements Serializable {
    @TableId(value = "id", type = IdType.UUID)
    private static final long serialVersionUID = 1L;

    private String id;
    private String workTitle;
    private String workDes;

    private String answerBeginTime;
    private String answerEndTime;
    /**
     * 作业发布者id
     */
    private String publishUserId;
    private String publishTime;

    private String classId;
    private String courseId;

    public String getWorkTitle() {
        return workTitle;
    }

    public void setWorkTitle(String workTitle) {
        this.workTitle = workTitle;
    }

    public String getWorkDes() {
        return workDes;
    }

    public void setWorkDes(String workDes) {
        this.workDes = workDes;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }



    public String getAnswerBeginTime() {
        return answerBeginTime;
    }

    public void setAnswerBeginTime(String answerBeginTime) {
        this.answerBeginTime = answerBeginTime;
    }

    public String getAnswerEndTime() {
        return answerEndTime;
    }

    public void setAnswerEndTime(String answerEndTime) {
        this.answerEndTime = answerEndTime;
    }

    public String getPublishUserId() {
        return publishUserId;
    }

    public void setPublishUserId(String publishUserId) {
        this.publishUserId = publishUserId;
    }

    public String getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }


    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId;
    }

    @Override
    public String toString() {
        return "Work{" +
                "id='" + id + '\'' +
                ", workTitle='" + workTitle + '\'' +
                ", workDes='" + workDes + '\'' +
                ", answerBeginTime='" + answerBeginTime + '\'' +
                ", answerEndTime='" + answerEndTime + '\'' +
                ", publishUserId='" + publishUserId + '\'' +
                ", publishTime='" + publishTime + '\'' +
                ", classId='" + classId + '\'' +
                ", courseId='" + courseId + '\'' +
                '}';
    }
}
