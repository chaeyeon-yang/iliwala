package com.hana.app.service;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberService implements HanaService<String, MemberDto> {
    final MemberRepository memberRepository;

    @Override
    public int add(MemberDto memberDto) throws Exception {
        return memberRepository.insert(memberDto);
    }

    @Override
    public int del(String memberId) throws Exception {
        return memberRepository.delete(memberId);
    }

    @Override
    public int modify(MemberDto memberDto) throws Exception {
        return memberRepository.update(memberDto);
    }

    @Override
    public MemberDto get(String memberId) throws Exception {
        return memberRepository.selectOne(memberId);
    }

    @Override
    public List<MemberDto> get() throws Exception {
        return memberRepository.select();
    }

    // 아이디 찾기
    public String findId(MemberDto memberDto) throws Exception {
        return memberRepository.findId(memberDto);
    }
    // 비밀번호 찾기
    public String findPw(MemberDto memberDto) throws Exception {
        return memberRepository.findPw(memberDto);
    }

    // 총 회원 수 조회
    public Integer memberCnt() throws Exception {
        return memberRepository.memberCnt();
    }

    // 회원 검색 - 아이디
    public List<MemberDto> searchId(String text) throws Exception {
        return memberRepository.searchId(text);
    }
}
