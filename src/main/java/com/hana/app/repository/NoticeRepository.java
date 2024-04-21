package com.hana.app.repository;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.data.dto.NoticeDto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface NoticeRepository extends HanaRepository<Integer, NoticeDto> {
    List<NoticeDto> searchTitle(String text) throws Exception;
    List<NoticeDto> searchContent(String text) throws Exception;
    Integer noticeCnt() throws Exception;
    List<NoticeDto> adminSearchTitle(String text) throws Exception;
    List<NoticeDto> adminSearchContent(String text) throws Exception;
    List<NoticeDto> adminSearchId(String text) throws Exception;
    List<NoticeDto> adminSearchAll (String text) throws Exception;
    List<NoticeDto> orderById (Integer option) throws Exception;
}
