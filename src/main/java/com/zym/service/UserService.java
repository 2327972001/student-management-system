package com.zym.service;

import com.zym.bean.User;

import java.util.List;

/*
* @program: UserService
* @description:
* @author: Mr.Zou
* @create: 2021-11-10 21:11
*/
public interface UserService {
    List<User> UserByGetList();
    User UserByLogin(String username,String password);
    Integer UserByDelete(Integer id);
    Integer UserByUpdate(User user);
    User UserByGet(Integer id);
    Integer UserByAdd(User user);
}
