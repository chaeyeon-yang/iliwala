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
import java.util.Map;

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
        return "redirect:/admin/notice";
    }

    // 회원 관리
    @RequestMapping("/notice")
    public String notice(Model model) throws Exception {
        List<NoticeDto> list = noticeService.get();
        Integer noticeCnt = noticeService.noticeCnt();
        model.addAttribute("notices", list);
        model.addAttribute("noticeCnt", noticeCnt);
        model.addAttribute("center",dir+"notice");
        return "index";
    }

    @ResponseBody
    @RequestMapping("/searchTitle")
    public ResponseEntity<List<NoticeDto>> searchTitle(@RequestParam("term") String noticeTitle) {
        try {
            List<NoticeDto> noticeList = noticeService.adminSearchTitle(noticeTitle);
            return ResponseEntity.ok().body(noticeList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @ResponseBody
    @RequestMapping("/adminSearchContent")
    public ResponseEntity<List<NoticeDto>> adminSearchContent(@RequestParam("term") String noticeTitle) {
        try {
            List<NoticeDto> noticeList = noticeService.adminSearchContent(noticeTitle);
            return ResponseEntity.ok().body(noticeList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    @ResponseBody
    @RequestMapping("/adminSearchId")
    public ResponseEntity<List<NoticeDto>> adminSearchId(@RequestParam("term") String noticeTitle) {
        try {
            List<NoticeDto> noticeList = noticeService.adminSearchId(noticeTitle);
            return ResponseEntity.ok().body(noticeList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    @ResponseBody
    @RequestMapping("/adminSearchAll")
    public ResponseEntity<List<NoticeDto>> adminSearchAll(@RequestParam("term") String noticeTitle) {
        try {
            List<NoticeDto> noticeList = noticeService.adminSearchAll(noticeTitle);
            return ResponseEntity.ok().body(noticeList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @ResponseBody
    @RequestMapping("/noticeOrderById")
    public List<NoticeDto> noticeOrderById(@RequestParam("orderOption") Integer option) {
        try {
            List<NoticeDto> noticeList = noticeService.orderById(option);
            return noticeList ;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    @ResponseBody
    @RequestMapping("/noticeOrderByRegDate")
    public List<NoticeDto> noticeOrderByRegDate(@RequestParam("orderOption") Integer option) {
        try {
            List<NoticeDto> noticeList = noticeService.orderByRegDate(option);
            return noticeList ;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // 보기
    @ResponseBody
    @RequestMapping("/noticePage")
    public List<NoticeDto> noticePage(@RequestBody PageDto pageDto) {
        try {
            List<NoticeDto> noticeList = noticeService.page(pageDto);
            return noticeList ;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // 공지상세
    @RequestMapping("/noticeDetail")
    public String noticeDetail(Model model, @RequestParam("no") Integer no) throws Exception {
        NoticeDto notice = noticeService.get(no);
        model.addAttribute("notice", notice);
        model.addAttribute("center", dir+"modifyNotice");
        return "index";
    }

    // 공지수정
    @ResponseBody
    @RequestMapping("/modifyNotice")
    public Integer modifyNotice(@RequestBody Map<String, Object> requestData) throws Exception {
        try {
            String noticeContent = (String) requestData.get("noticeContent");
            Integer idx = (Integer) requestData.get("idx");

            if (noticeContent != null && idx != null) {
                NoticeDto noticeDto1 = NoticeDto.builder().noticeContent(noticeContent).noticeIdx(idx).build();
                noticeService.modify(noticeDto1);
                return 1;
            } else {
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}
