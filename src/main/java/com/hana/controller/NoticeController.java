package com.hana.controller;

import com.hana.app.service.NoticeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor
public class NoticeController {
    String dir = "notice/";

    final NoticeService noticeService;

    @RequestMapping("/")
    public String board(Model model){
        model.addAttribute("center",dir+"notice");
        return "index";
    }
}
