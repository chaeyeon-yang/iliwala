package com.hana.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {

    String dir = "member/";

    @RequestMapping("/login")
    public String main(Model model) {
        model.addAttribute("center",dir+"login");
        return "index";
    }
}
