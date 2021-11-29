package com.zym.service.impl;

import com.zym.bean.User;
import com.zym.dao.UserDao;
import com.zym.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public List<User> UserByGetList() {
        return userDao.UserByGetList();
    }

    @Override
    public User UserByLogin(String username, String password) {
        return userDao.UserByLogin(username,password);
    }

    @Override
    public Integer UserByDelete(Integer id) {
        return userDao.UserByDelete(id);
    }

    @Override
    public Integer UserByUpdate(User user) {
        return userDao.UserByUpdate(user);
    }

    @Override
    public User UserByGet(Integer id) {
        return userDao.UserByGet(id);
    }

    @Override
    public Integer UserByAdd(User user) {
        return userDao.UserByAdd(user);
    }

    @Override
    public List<User> UserByShow(User user) {
        return userDao.UserByShow(user);
    }

    @Override
    public Integer deleteByIdList(Integer[] ids) {
        return userDao.deleteByIdList(ids);
    }


}
