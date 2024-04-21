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

    @RequestMapping("/logout")
    public String logout(Model model, HttpSession httpSession) {
        httpSession.removeAttribute("memberId");
        return "index";
    }

    @ResponseBody
    @RequestMapping("/loginimpl")
    public Integer loginimpl(Model model,@RequestParam("memberId") String id, @RequestParam("memberPw") String pw, HttpSession httpSession) {
        // 아이디 없음: 0, 비밀번호 틀림: 1, 로그인 성공: 2
        MemberDto member = null;
        try {
            member = memberService.get(id);
            if (!member.getMemberPw().equals(pw)) {
                return 1;
            } else {
                httpSession.setAttribute("memberId", member.getMemberId());
                return 2;
            }
        } catch (Exception e){
            return 0;
        }
    }

    @RequestMapping("/join")
    public String join(Model model) {
        model.addAttribute("center",dir+"join");
        return "index";
    }

    @RequestMapping("/joinimpl")
    public String joinimpl(Model model,
                           MemberDto memberDto) throws Exception {

        memberService.add(memberDto);
        model.addAttribute("center", dir + "login");

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

    @RequestMapping("/idFind")
    public String idFind() {
        return dir+"idFind";
    }


    @ResponseBody
    @RequestMapping("/idFindImpl")
    public String idFindImpl(Model model, @RequestParam("memberName") String memberName, @RequestParam("memberEmail") String memberEmail) {
        // id 반환
        MemberDto member = MemberDto.builder().memberName(memberName).memberEmail(memberEmail).build();
        String memberId = null;
        try {
            memberId = memberService.findId(member);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return memberId;
    }

    @RequestMapping("/idFindMsg")
    public String idFindMsg(Model model, @RequestParam("memberId") String memberId) {
        model.addAttribute("memberId", memberId);

        return dir+"/idFindMsg";
    }

    @RequestMapping("/pwFind")
    public String pwFind() {
        return dir+"pwFind";
    }

    @ResponseBody
    @RequestMapping("/pwFindImpl")
    public String pwFindImpl( @RequestParam("memberName") String memberName, @RequestParam("memberId") String memberId, @RequestParam("memberEmail") String memberEmail) {
        // pw 반환
        MemberDto member = MemberDto.builder().memberName(memberName).memberId(memberId).memberEmail(memberEmail).build();
        String memberPw = null;
        try {
            memberPw = memberService.findPw(member);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return memberPw;
    }

    @RequestMapping("/pwFindMsg")
    public String pwFindMsg(Model model, @RequestParam("memberPw") String memberPw) {
        model.addAttribute("memberPw", memberPw);

        return dir+"/pwFindMsg";
    }
}
