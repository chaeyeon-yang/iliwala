package com.hana.app.service;

import com.hana.app.data.dto.QnaDto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.QnaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class QnaService implements HanaService<Integer, QnaDto> {
    final QnaRepository qnaRepository;

    @Override
    public int add(QnaDto qnaDto) throws Exception {
        return 0;
    }

    @Override
    public int del(Integer integer) throws Exception {
        return 0;
    }

    @Override
    public int modify(QnaDto qnaDto) throws Exception {
        return 0;
    }

    @Override
    public QnaDto get(Integer integer) throws Exception {
        return qnaRepository.selectOne(integer);
    }

    @Override
    public List<QnaDto> get() throws Exception {
        return qnaRepository.select();
    }

    public List<QnaDto> searchTitle(String text) throws Exception {
        return qnaRepository.searchTitle(text);
    }
    public List<QnaDto> searchContent(String text) throws Exception {
        return qnaRepository.searchContent(text);
    }
    public List<QnaDto> searchName(String text) throws Exception {
        return qnaRepository.searchName(text);
    }
    public QnaDto enterPw(String pw) throws Exception {
        return qnaRepository.enterPw(pw);
    }
}
