package com.hana.controller;

import com.hana.app.data.dto.One2oneDto;
import com.hana.app.service.One2OneService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer")
@RequiredArgsConstructor
public class One2OneController {
    String dir = "customer/";

    final One2OneService one2OneService;

    @RequestMapping("/inquiry")
    public String inquiry(Model model) throws Exception {
        model.addAttribute("center",dir+"inquiry");
        return "index";
    }

    @RequestMapping("/inquiryimpl")
    public String inquiryimpl(One2oneDto one2oneDto) throws Exception {
        one2OneService.add(one2oneDto);
        return "index";
    }

    @RequestMapping("/askanswer")
    public String askanswer(Model model) throws Exception {
        model.addAttribute("center",dir+"askanswer");
        return "index";
    }
}
