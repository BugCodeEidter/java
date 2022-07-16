package com.ljl.mapper;

import com.ljl.pojo.User;

public interface UserMapper {
    User findUserByUsername(String username);

    User findUser(User user);

    void addUser(User user);
}
