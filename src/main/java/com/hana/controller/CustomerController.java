package com.hana.controller;

import com.hana.app.data.dto.One2oneDto;
import com.hana.app.data.dto.QnaDto;
import com.hana.app.service.One2OneService;
import com.hana.app.service.QnaService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/customer")
@RequiredArgsConstructor
public class CustomerController {
    String dir = "customer/";

    final One2OneService one2OneService;

    final QnaService qnaService;

    // 1:1 문의
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

    // 묻고 답하기
    @RequestMapping("/askanswer")
    public String askanswer(Model model) throws Exception {
        List<QnaDto> qnaList = qnaService.get();
        model.addAttribute("qnaList",qnaList);
        model.addAttribute("center",dir+"askanswer");
        return "index";
    }
}
