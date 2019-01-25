package com.doctorro.user.index.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/user/")
public class UserIndexController {
    @RequestMapping("index")
    public String index(Model model) {
        return "user.index.index";
    }
}
