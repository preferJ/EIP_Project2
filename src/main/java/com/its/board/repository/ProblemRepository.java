package com.its.board.repository;

import com.its.board.dto.AnswerDTO;
import com.its.board.dto.ProblemDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ProblemRepository {

    @Autowired
    private SqlSessionTemplate sql;

    public List<ProblemDTO> startSet(Map<String, String> stringStringMap) {

        return sql.selectList("Problem.startSet",stringStringMap);
    }


}
