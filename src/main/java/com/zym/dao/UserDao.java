package com.zym.dao;

import com.zym.bean.User;

import java.util.List;

public interface UserDao {
    List<User> UserByGetList();
    User UserByLogin(String username, String password);
    Integer UserByDelete(Integer id);
    Integer UserByUpdate(User user);
    User UserByGet(Integer id);
    Integer UserByAdd(User user);
    List<User> UserByShow(User user);
}
