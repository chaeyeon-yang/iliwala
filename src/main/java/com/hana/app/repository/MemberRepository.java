package com.hana.app.repository;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MemberRepository extends HanaRepository<String, MemberDto> {
    String findId(MemberDto memberDto) throws Exception;
    String findPw(MemberDto memberDto) throws Exception;
}
