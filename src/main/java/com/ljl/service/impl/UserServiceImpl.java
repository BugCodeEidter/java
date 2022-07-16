package com.ljl.service.impl;

import com.ljl.mapper.UserMapper;
import com.ljl.pojo.User;
import com.ljl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Override
    public User findUserByUsername(String username) {
        return userMapper.findUserByUsername(username);
    }

    @Override
    public User findUser(User user) {
        return userMapper.findUser(user);
    }

    @Override
    public void addUser(User user) {
        userMapper.addUser(user);
    }
}
