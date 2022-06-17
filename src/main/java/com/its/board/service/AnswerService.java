package com.its.board.service;

import com.its.board.dto.AnswerDTO;
import com.its.board.dto.CommentDTO;
import com.its.board.repository.AnswerRepository;
import com.its.board.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AnswerService {
    @Autowired
    private AnswerRepository answerRepository;

    public void addResult(AnswerDTO newAnswerDTO) {
        answerRepository.addResult(newAnswerDTO);
    }
}
