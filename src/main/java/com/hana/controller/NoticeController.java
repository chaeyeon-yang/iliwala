package com.hana.controller;

import com.hana.app.data.dto.NoticeDto;
import com.hana.app.service.NoticeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor
@Slf4j
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

    @RequestMapping("/searchTitle")
    public String searchTitle(Model model, @RequestParam("term") String noticeTitle) {
        try {
            List<NoticeDto> noticeList = noticeService.searchTitle(noticeTitle);
            model.addAttribute("notices", noticeList);
            model.addAttribute("center",dir+"notice");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "index";
    }

    @RequestMapping("/searchContent")
    public String searchContent(Model model, @RequestParam("term") String noticeContent) {
        try {
            List<NoticeDto> noticeList = noticeService.searchContent(noticeContent);
            model.addAttribute("notices", noticeList);
            model.addAttribute("center",dir+"notice");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "index";
    }
}
