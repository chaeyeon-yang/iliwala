package com.hana.member;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.service.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.sql.Date;
import java.sql.SQLException;

@SpringBootTest
@Slf4j
public class InsertTests {
    @Autowired
    MemberService memberService;

    @Test
    void contextLoads() {
        MemberDto memberDto = MemberDto.builder().memberId("myday").memberPw("0907").memberName("마이데이").memberEmail("myday@gmail.com").memberEmailReceive(0).memberPwQuestion(0).memberPwAnswer("평생 마이데이").memberGender("female").memberBirthDate(new Date(2015,9,7)).build();
//        MemberDto memberDto = MemberDto.builder().memberId("wonpil").memberPw("0428").memberName("김원필").memberEmail("pilrangdan@gmail.com").memberEmailReceive(0).memberPwQuestion(0).memberPwAnswer("필").memberGender("male").memberBirthDate(new Date(1994,4,28)).build();
        try {
            memberService.add(memberDto);
            log.info("------------OK------------");
        } catch (Exception e) {
            if(e instanceof SQLException){
                log.info("----------System Trouble EX0001----------------");
            }else if(e instanceof DuplicateKeyException){
                log.info("----------ID Duplicated EX0002----------------");
            }else{
                log.info("----------Sorry EX0003----------------");
            }
        }
    }
}
