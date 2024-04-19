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
public class One2oneDto {
    private int one2oneIdx;
    private String one2oneName;
    private String one2onePhone;
    private String one2oneEmail;
    private String one2oneAddress;
    private String one2oneTitle;
    private String one2oneContent;
    private Date one2oneDate;
}
