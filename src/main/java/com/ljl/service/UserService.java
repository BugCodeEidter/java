package com.ljl.service;

import com.ljl.pojo.User;

public interface UserService {
    User findUserByUsername(String username);

    User findUser(User user);

    void addUser(User user);
}
