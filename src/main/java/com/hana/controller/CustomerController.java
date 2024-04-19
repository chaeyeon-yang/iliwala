package com.hana.controller;

import com.hana.app.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer")
@RequiredArgsConstructor
public class CustomerController {
    String dir = "customer/";

    @RequestMapping("/inquiry")
    public String inquiry(Model model) {
        model.addAttribute("center",dir+"inquiry");
        return "index";
    }
}
