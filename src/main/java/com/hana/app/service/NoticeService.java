package com.hana.app.service;

import com.hana.app.data.dto.NoticeDto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.NoticeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class NoticeService implements HanaService<Integer, NoticeDto> {
    final NoticeRepository noticeRepository;

    @Override
    public int add(NoticeDto noticeDto) throws Exception {
        return noticeRepository.insert(noticeDto);
    }

    @Override
    public int del(Integer integer) throws Exception {
        return 0;
    }

    @Override
    public int modify(NoticeDto noticeDto) throws Exception {
        return 0;
    }

    @Override
    public NoticeDto get(Integer integer) throws Exception {
        return noticeRepository.selectOne(integer);
    }

    @Override
    public List<NoticeDto> get() throws Exception {
        return noticeRepository.select();
    }

    public List<NoticeDto> searchTitle(String text) throws Exception {
        return noticeRepository.searchTitle(text);
    }

    public List<NoticeDto> searchContent(String text) throws Exception {
        return noticeRepository.searchContent(text);
    }

    public Integer noticeCnt() throws Exception {
        return noticeRepository.noticeCnt();
    }

    // ----------관리자
    // 공지사항 검색
    public List<NoticeDto> adminSearchTitle(String term) throws Exception {
        return noticeRepository.adminSearchTitle(term);
    }
    public List<NoticeDto> adminSearchContent(String term) throws Exception {
        return noticeRepository.adminSearchContent(term);
    }
    public List<NoticeDto> adminSearchId(String term) throws Exception {
        return noticeRepository.adminSearchId(term);
    }
}
