package com.its.board.service;

import com.its.board.dto.AnswerDTO;
import com.its.board.dto.ProblemDTO;
import com.its.board.repository.ProblemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProblemService {

    @Autowired
    private ProblemRepository problemRepository;

    public List<ProblemDTO> startSet(Map<String, String> stringStringMap) {
       return problemRepository.startSet(stringStringMap);
    }


}
