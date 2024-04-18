package com.hana.notice;

import com.hana.app.service.NoticeService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class SearchTitleTests {
    @Autowired
    NoticeService noticeService;

    @Test
    void contextLoads() {
        String text = "여름";
        try {
            noticeService.searchTitle(text);
            log.info("------------OK-------------");
        } catch (Exception e) {
            log.info("------------SORRY-------------");
        }
    }

}
