package com.hana.app.repository;

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
}
