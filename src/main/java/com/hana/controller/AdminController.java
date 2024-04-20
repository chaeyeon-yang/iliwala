package com.hana.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminController {
    String dir = "admin/";

    @RequestMapping("")
    public String login(Model model) throws Exception {
        model.addAttribute("center", dir+"login");
        return "index";
    }
}
