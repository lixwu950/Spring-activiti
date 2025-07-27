package com.ruoyi.web.controller.demo.controller;

import com.ruoyi.web.controller.demo.entity.RegisterForm;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/demo/login")
public class LoginDemoController {

    @RequestMapping("/login")
    public String showRegisterPage(Model model) {
        model.addAttribute("registerForm", new RegisterForm());
        return "login/login_demo";
    }
}
