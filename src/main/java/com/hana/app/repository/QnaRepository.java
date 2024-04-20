package com.hana.app.repository;

import com.hana.app.data.dto.QnaDto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface QnaRepository extends HanaRepository<Integer, QnaDto> {
    List<QnaDto> searchTitle(String text) throws Exception;
    List<QnaDto> searchContent(String text) throws Exception;
    List<QnaDto> searchName(String text) throws Exception;
    QnaDto enterPw(String pw) throws Exception;
}
