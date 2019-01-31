package com.doctorro.user.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/user/")
public class LoginController {
    @RequestMapping("login")
    public String index(Model model) {
        return "user.login";
    }
}
