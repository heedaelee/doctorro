package com.doctorro.doctor.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/doctor/")
public class LoginController {
    @RequestMapping("login")
    public String index(Model model) {
        return "doctor.login";
    }
}
