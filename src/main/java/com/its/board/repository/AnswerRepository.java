package com.its.board.repository;

import com.its.board.dto.AnswerDTO;
import com.its.board.dto.ProblemDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class AnswerRepository {


    @Autowired
    private SqlSessionTemplate sql;

    public void addResult(AnswerDTO newAnswerDTO) {
        sql.insert("Answer.save",newAnswerDTO);
    }
}
