package com.zym.controller;

import com.zym.bean.User;
import com.zym.bean.UserCookie;
import com.zym.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class IndexController {

    @Autowired
    UserService userService;

    //用户登录
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(String username,String password,Model model, HttpSession session){
        if(userService.UserByLogin(username,password)!=null){
            UserCookie user = new UserCookie();
            user.setUname(username);
            user.setUpassword(password);
            // 登录成功，将用户信息保存到session对象中
            session.setAttribute("user", user);
            // 重定向到主页面的跳转方法
            return "redirect:/user/list";
        }else{
            model.addAttribute("msg", "用户名或密码错误，请重新登录！");
            return "login";
        }
    }

    //退出登录
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        // 清除 session
        session.invalidate();
        return "login";
    }

    //用户列表
    @RequestMapping(value = "/list")
    public String userList(Model model){
        List<User> user = userService.UserByGetList();
        model.addAttribute("userList", user);
        return "user";
    }

    //删除用户
    @RequestMapping(value = "/deleteUser/{id}")
    public String deleteUser(@PathVariable Integer id){
        userService.UserByDelete(id);
        return "redirect:/user/list";
    }

    //修改用户
    @RequestMapping(value = "/update/{id}")
    public String update(@PathVariable Integer id,Model model){
        User user = userService.UserByGet(id);
        model.addAttribute("user",user);
        return "userupdate";
    }
    @RequestMapping(value = "/updateuser/{id}")
    public String updateuser(@PathVariable Integer id,User user){
        user.setId(id);
        userService.UserByUpdate(user);
        return "redirect:/user/list";
    }

    //增加用户
    @RequestMapping(value = "/adduser")
    public String adduser(){
        return "useradd";
    }
    @RequestMapping(value = "/adduservalue")
    public String adduservalue(User user){
        userService.UserByAdd(user);
        return "redirect:/user/list";
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
}
