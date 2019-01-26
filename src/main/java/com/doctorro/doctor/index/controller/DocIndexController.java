package com.doctorro.doctor.index.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/doctor/")
public class DocIndexController {
    @RequestMapping("index")
    public String index(Model model) {
        return "doctor.index.index";
    }

}
