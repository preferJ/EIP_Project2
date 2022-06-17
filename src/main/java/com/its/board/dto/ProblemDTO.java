package com.its.board.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProblemDTO {

    private int  id ;
    private String problemSubject;
    private String problemYear;
    private String problemQ;
    private String problemQNum;
    private String problemA1;
    private String problemA2;
    private String problemA3;
    private String problemA4;
    private int problemAnswer ;
    private String problemDescription;
}
