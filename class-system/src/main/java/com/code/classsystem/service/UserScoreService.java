package com.code.classsystem.service;

import com.code.classsystem.entity.UserScore;
import com.baomidou.mybatisplus.service.IService;


public interface UserScoreService extends IService<UserScore> {

    boolean addUserScore(UserScore userScore);

    UserScore queryUserScore(UserScore userScore);
}
