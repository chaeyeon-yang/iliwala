package com.hana.controller;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {

    String dir = "member/";

    final MemberService memberService;

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center",dir+"login");
        return "index";
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model,@RequestParam("id") String id,HttpSession httpSession) {
        String userId = httpSession.getId();
        if (id.equals(userId)) {
            httpSession.setAttribute("id", id);
        }
        model.addAttribute("center","main");
        return "index";
    }

    @RequestMapping("/join")
    public String join(Model model) {
        model.addAttribute("center",dir+"join");
        return "index";
    }

    @RequestMapping("/join2")
    public String join2(Model model) {
        model.addAttribute("center",dir+"join2");
        return "index";
    }

    @ResponseBody
    @RequestMapping("/checkIdDuplicate")
    public Integer checkIdDuplicate(@RequestParam("id") String id) throws Exception {
        // id가 존재하면 0(아이디 중복), id가 존재하지 않으면 1(아이디 중복 x, 사용 가능)
        int result = 0;
        MemberDto memberDto = memberService.get(id);
        if (memberDto == null) {
            result = 1;
        }
        return result;
    }
}
