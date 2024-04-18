package com.hana.app.repository;

import com.hana.app.data.dto.NoticeDto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface NoticeRepository extends HanaRepository<Integer, NoticeDto> {
}
