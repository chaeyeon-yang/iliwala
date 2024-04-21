package com.hana.controller;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.data.dto.NoticeDto;
import com.hana.app.data.dto.One2oneDto;
import com.hana.app.data.dto.QnaDto;
import com.hana.app.service.One2OneService;
import com.hana.app.service.QnaService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public String inquiry(Model model, HttpSession httpSession) throws Exception {
        if (httpSession.getAttribute("memberId") == null) {
            model.addAttribute("showAlert", "로그인이 필요한 서비스입니다.");
        }
        model.addAttribute("center",dir+"inquiry");
        return "index";
    }

    // faq
    @RequestMapping("/faq")
    public String faq(Model model, HttpSession httpSession) throws Exception {
        if (httpSession.getAttribute("memberId") == null) {
            model.addAttribute("showAlert", "로그인이 필요한 서비스입니다.");
        }
        model.addAttribute("center",dir+"faq");
        return "index";
    }

    @RequestMapping("/inquiryimpl")
    public String inquiryimpl(One2oneDto one2oneDto) throws Exception {
        one2OneService.add(one2oneDto);
        return "index";
    }

    // 묻고 답하기
    @RequestMapping("/askanswer")
    public String askanswer(Model model, HttpSession httpSession) throws Exception {
        if (httpSession.getAttribute("memberId") == null) {
            model.addAttribute("showAlert", "로그인이 필요한 서비스입니다.");
        }
        List<QnaDto> qnaList = qnaService.get();
        model.addAttribute("qnaList",qnaList);
        model.addAttribute("center",dir+"askanswer");
        return "index";
    }

    @RequestMapping("/searchTitle")
    public String searchTitle(Model model, @RequestParam("term") String term) {
        try {
            List<QnaDto> qnaList = qnaService.searchTitle(term);
            model.addAttribute("qnaList", qnaList);
            model.addAttribute("center",dir+"askanswer");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "index";
    }

    @RequestMapping("/searchContent")
    public String searchContent(Model model, @RequestParam("term") String term) {
        try {
            List<QnaDto> qnaList = qnaService.searchContent(term);
            model.addAttribute("qnaList", qnaList);
            model.addAttribute("center",dir+"askanswer");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "index";
    }

    @RequestMapping("/searchName")
    public String searchName(Model model, @RequestParam("term") String term) {
        try {
            List<QnaDto> qnaList = qnaService.searchName(term);
            model.addAttribute("qnaList", qnaList);
            model.addAttribute("center",dir+"askanswer");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "index";
    }

    @RequestMapping("/askanswerPw")
    public String askanswerPw() {
        return dir+"askanswerPw";
    }

    @ResponseBody
    @RequestMapping("/checkPw")
    public Integer checkPw(@RequestParam("qnaPw") String qnaPw) throws Exception {
        // qnaIdx: 유효한 게시글 비밀번호 -> 게시글 인덱스 반환, 0: 유효하지 않은 게시글 비밀번호
        QnaDto qnaDto = qnaService.enterPw(qnaPw);
        if (qnaDto == null) {
            return 0;
        }
        if (qnaPw.equals(qnaDto.getQnaPw())) {
            return qnaDto.getQnaIdx();
        }
        return 0;
    }

    @RequestMapping("/askanswerPwMsg")
    public String askanswerPwMsg() {
        return dir+"askanswerPwMsg";
    }

    @RequestMapping("/askanswerDetail")
    public String askanswerDetail(Model model, @RequestParam("no") Integer no) throws Exception {
        QnaDto qnaDto = qnaService.get(no);
        model.addAttribute("qnaDto", qnaDto);
        model.addAttribute("center", dir+"askanswerDetail");
        return "index";
    }

}
