package com.ljl.controller;


import com.ljl.pojo.User;
import com.ljl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;
    @RequestMapping("/checkName")
    @ResponseBody
    public String checkName(@RequestBody User user){
        User userByUsername = userService.findUserByUsername(user.getUsername());
        if(userByUsername!=null){
            return "√用户存在";
        }else {
            return "×用户不存在";
        }
    }

    @RequestMapping("/userLogin")
    public String userLogin(User user, Model model){
        User userTest=userService.findUser(user);
        System.out.println(userTest);
        if(userTest!=null){
            return "main";
        }else {
            model.addAttribute("message","用户名或验证码,错误");
            return "/login";
        }
    }

    @RequestMapping("/goUserLogin")
    public String goToLogin(){
        return "login";
    }

    @RequestMapping("/register")
    public String register(User user){
        userService.addUser(user);
        return "login";
    }


    @RequestMapping("/goUserRegister")
    public String goUserRegister(){
        return "register";
    }
}
