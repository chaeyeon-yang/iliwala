package com.hana.controller;


import com.hana.app.data.dto.*;
import com.hana.app.service.AdminService;
import com.hana.app.service.MemberService;
import com.hana.app.service.NoticeService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/admin")
@Controller
@RequiredArgsConstructor
@Slf4j
public class AdminController {
    String dir = "admin/";

    private final AdminService adminService;
    private final MemberService memberService;
    private final NoticeService noticeService;

    @RequestMapping("")
    public String login(Model model) throws Exception {
        model.addAttribute("center", dir+"login");
        return "index";
    }

    @ResponseBody
    @RequestMapping("/loginimpl")
    public Integer loginimpl(Model model, @RequestParam("memberId") String id, @RequestParam("memberPw") String pw, HttpSession httpSession) {
        // 아이디 없음: 0, 비밀번호 틀림: 1, 로그인 성공: 2
        AdminDto member = null;
        try {
            member = adminService.get(id);
            if (!member.getMemberPw().equals(pw)) {
                return 1;
            } else {
                httpSession.setAttribute("memberId", member.getMemberid());
                return 2;
            }
        } catch (Exception e){
            return 0;
        }
    }

    @RequestMapping("/member")
    public String member(Model model) throws Exception {
        List<MemberDto> members = memberService.get();
        Integer memberCnt = memberService.memberCnt();

        model.addAttribute("memberCnt", memberCnt);
        model.addAttribute("members", members);
        model.addAttribute("center", dir+"member");
        return "index";
    }

    // 검색
    @RequestMapping("/searchId")
    @ResponseBody
    public ResponseEntity<List<MemberDto>> searchId(Model model, @RequestParam("term") String term) {
        try {
            List<MemberDto> memberList = memberService.searchId(term);
            return ResponseEntity.ok().body(memberList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @RequestMapping("/searchName")
    @ResponseBody
    public ResponseEntity<List<MemberDto>> searchName(Model model, @RequestParam("term") String term, MemberDto memberDto) {
        try {
            List<MemberDto> memberList = memberService.searchName(term);
            return ResponseEntity.ok().body(memberList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // 검색
    @GetMapping("/searchEmail")
    @ResponseBody
    public ResponseEntity<List<MemberDto>> searchEmail(@RequestParam("term") String term) {
        try {
            List<MemberDto> memberList = memberService.searchEmail(term);
            return ResponseEntity.ok().body(memberList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


    @RequestMapping("/searchAll")
    @ResponseBody
    public ResponseEntity<List<MemberDto>> searchAll(Model model, @RequestParam("term") String term) {
        try {
            List<MemberDto> memberList = memberService.searchAll(term);
            return ResponseEntity.ok().body(memberList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // 정렬
    @ResponseBody
    @RequestMapping("/orderById")
    public List<MemberDto> orderById(@RequestBody SearchDto orderRequest) {
        try {
            List<MemberDto> memberList = memberService.orderById(orderRequest);
            return memberList ;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    @ResponseBody
    @RequestMapping("/orderByRegDate")
    public List<MemberDto> orderByRegDate(@RequestBody SearchDto orderRequest) {
        try {
            List<MemberDto> memberList = memberService.orderByRegDate(orderRequest);
            return memberList;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // 보기
    @ResponseBody
    @RequestMapping("/page")
    public List<MemberDto> page(@RequestBody PageDto pageDto) {
        try {
            List<MemberDto> memberList = memberService.page(pageDto);
            return memberList ;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // 공지글쓰기
    @RequestMapping("/writeNotice")
    public String writeNotice(Model model) {
        model.addAttribute("center",dir+"writeNotice");
        return "index";
    }

    @RequestMapping("/writeNoticeImpl")

    public String writeNoticeImpl(Model model, NoticeDto noticeDto) throws Exception {
        noticeService.add(noticeDto);
        model.addAttribute("center",dir+"writeNotice");
        return "index";
    }
}
