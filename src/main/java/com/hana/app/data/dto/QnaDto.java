package com.hana.app.data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class QnaDto {
    private int qnaIdx;
    private String qnaName;
    private String qnaPw;
    private String qnaTitle;
    private String qnaContent;
    private Date qnaDate;
}
