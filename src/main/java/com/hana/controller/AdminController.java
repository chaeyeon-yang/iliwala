package com.hana.controller;


import com.hana.app.data.dto.AdminDto;
import com.hana.app.data.dto.MemberDto;
import com.hana.app.service.AdminService;
import com.hana.app.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("/admin")
@Controller
@RequiredArgsConstructor
public class AdminController {
    String dir = "admin/";

    private final AdminService adminService;
    private final MemberService memberService;

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

//    @RequestMapping("/member")
//    public String member(Model model) throws Exception {
//        List<MemberDto> members = memberService.get();
//        model.addAttribute("members", members);
//        model.addAttribute("center", dir+"member");
//        return "index";
//    }
}
