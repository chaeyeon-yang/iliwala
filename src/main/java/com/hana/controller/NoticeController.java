package com.hana.controller;

import com.hana.app.data.dto.NoticeDto;
import com.hana.app.service.NoticeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor
public class NoticeController {
    String dir = "notice/";

    final NoticeService noticeService;

    @RequestMapping("/")
    public String board(Model model){
        List<NoticeDto> list = null;
        try {
            list = noticeService.get();
            model.addAttribute("notices", list);
            model.addAttribute("center",dir+"notice");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "index";
    }
}
