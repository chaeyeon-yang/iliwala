package com.hana.member;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.service.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class FindPwTests {
    @Autowired
    MemberService memberService;

    @Test
    void contextLoads() {
        MemberDto member = MemberDto.builder().memberName("양삼식").memberId("samsic").memberEmail("samsiclove@gmail.com").build();
        try {
            memberService.findPw(member);
            log.info("------------OK-------------");
        } catch (Exception e) {
            log.info("------------SORRY-------------");
        }

    }
}
