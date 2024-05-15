package com.code.classsystem.service.impl;

import com.code.classsystem.entity.Role;
import com.code.classsystem.dao.RoleMapper;
import com.code.classsystem.service.RoleService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;


@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

}
