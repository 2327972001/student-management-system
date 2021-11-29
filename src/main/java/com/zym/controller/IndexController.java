package com.zym.controller;

import com.zym.bean.Ajax;
import com.zym.bean.User;
import com.zym.bean.UserCookie;
import com.zym.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/*
* @program: IndexController
* @description:
* @author: Mr.Zou
* @create: 2021-11-23 15:44
*/
@Controller
@RequestMapping("/user")
public class IndexController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/login")
    public String logins(){
        return "login";
    }

    //用户登录
    @RequestMapping(value = "/logins", method = RequestMethod.POST)
    @ResponseBody
    public Object login(String username,String password,HttpSession session){
        Ajax ajax = new Ajax();
        if(userService.UserByLogin(username,password)!=null){
            UserCookie user = new UserCookie();
            user.setUname(username);
            user.setUpassword(password);
            // 登录成功，将用户信息保存到session对象中
            session.setAttribute("user", user);
            ajax.setSuccess(true);
            return ajax;
        }else{
            ajax.setSuccess(false);
            return ajax;
        }
    }

    //退出登录
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        // 清除 session
        session.invalidate();
        return "redirect:/user/login";
    }

    //用户列表页面
    @RequestMapping(value = "/list")
    public String list(){
        return "user";
    }

    //发送用户列表给前端
    @ResponseBody
    @RequestMapping(value = "/userList")
    public Object userList(){
        Ajax ajaxRequest = new Ajax();
        ajaxRequest.setSuccess(true);
        ajaxRequest.setData(userService.UserByGetList());
        return ajaxRequest;
    }

    //删除用户
    @ResponseBody
    @RequestMapping(value = "/deleteUser")
    public Object deleteUser(Integer id){
        Ajax ajaxRequest = new Ajax();
        userService.UserByDelete(id);
        ajaxRequest.setSuccess(true);
        return ajaxRequest;
    }

    //发送用户信息
    @ResponseBody
    @RequestMapping(value = "/update/{id}")
    public Object update(@PathVariable Integer id){
        Ajax ajaxRequest = new Ajax();
        ajaxRequest.setData(userService.UserByGet(id));
        ajaxRequest.setSuccess(true);
        return ajaxRequest;
    }

    //修改用户
    //responseBody将返回值转化为json格式响应到客户端
    //requestBody将请求数据转化为json对象
    @RequestMapping(value = "/updateuser")
    @ResponseBody
    public Object updateuser(User user){
        Ajax ajaxRequest = new Ajax();
        if(userService.UserByUpdate(user)>0){
            ajaxRequest.setSuccess(true);
        }else{
            ajaxRequest.setSuccess(false);
        }
        return ajaxRequest;
    }

    //增加用户
    @RequestMapping(value = "/adduser")
    public String adduser(){
        return "useradd";
    }

    @RequestMapping(value = "/adduservalue")
    @ResponseBody
    public Object adduservalue(User user){
        Ajax ajaxRequest = new Ajax();
        if(userService.UserByAdd(user)>0){
            ajaxRequest.setSuccess(true);
        }else{
            ajaxRequest.setSuccess(false);
        }
        return ajaxRequest;
    }

    //查询用户信息
    @RequestMapping(value = "/showuser", method = RequestMethod.POST)
    public String showuser(Integer type,String value,Model model){
        User user = new User();
        if(value!=null && value!="") {//禁止输入框为空
            if (type == 1) {
                user.setId(Integer.valueOf(value));
            } else if (type == 2) {
                user.setName(value);
            } else if (type == 3) {
                user.setUsername(value);
            } else if (type == 4) {
                user.setSex(value.charAt(0));
            } else if (type == 5) {
                user.setSquad(value);
            }
            if (type != 0 && value != null && value != "") {
                List<User> list = userService.UserByShow(user);
                model.addAttribute("userList", list);
                return "usershow";
            } else {
                return "redirect:/user/list";
            }
        }else{
            return "redirect:/user/list";
        }
    }

    //批量删除
    @ResponseBody
    @RequestMapping("/deleteUserList")
    public Object deleteByIdList(Integer[] deletelist){
        userService.deleteByIdList(deletelist);
        Ajax ajaxRequest = new Ajax();
        ajaxRequest.setSuccess(true);
        return ajaxRequest;
    }
}
