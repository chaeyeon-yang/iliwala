package com.hana.controller;

import com.hana.app.data.dto.One2oneDto;
import com.hana.app.service.CustomerService;
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

    final CustomerService customerService;

    @RequestMapping("/inquiry")
    public String inquiry(Model model) throws Exception {
        model.addAttribute("center",dir+"inquiry");
        return "index";
    }
    @RequestMapping("/inquiryimpl")
    public String inquiryimpl(One2oneDto one2oneDto) throws Exception {
        customerService.add(one2oneDto);
        return "index";
    }
}
