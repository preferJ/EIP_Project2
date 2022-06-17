package com.its.board.controller;

import com.its.board.dto.AnswerDTO;
import com.its.board.dto.ProblemDTO;
import com.its.board.service.AnswerService;
import com.its.board.service.MemberService;
import com.its.board.service.ProblemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/problem")
public class ProblemController {
    @Autowired
    private ProblemService problemService;

    @Autowired
    private AnswerService answerService;

    @Autowired
    private MemberService memberService;

    @GetMapping("/startPage")
    public String startPage() {
        return "problemSet";
    }

    @PostMapping("/startSet")
    public String startSet(
            @RequestParam("problemYear") String problemYear,
            @RequestParam("problemSubject") String problemSubject,
            @RequestParam(value = "problemWrong", required = false) String problemWrong,
            @RequestParam(value = "problemCheck", required = false) String problemCheck,
            Model model) {
        System.out.println(problemYear);
        System.out.println(problemSubject);
        Map<String, String> stringStringMap = new HashMap<>();
        stringStringMap.put("problemYear", problemYear);
        stringStringMap.put("problemSubject", problemSubject);
        List<ProblemDTO> problemDTOList = problemService.startSet(stringStringMap);

        Map<Integer, ProblemDTO> integerStringMap = new HashMap<>();
        for (int i = 1; i < problemDTOList.size() + 1; i++) {
            integerStringMap.put(i, problemDTOList.get(i - 1));
        }

        model.addAttribute("integerStringMap", integerStringMap);


        return "ProblemStart";
    }

    @PostMapping("/submitAns")
    public String submitAns(
            @RequestParam("Map") Map<String, ProblemDTO> integerStringMap,
            @RequestParam("answerList") List<String> answerList,
            HttpSession session,
            Model model) {
        System.out.println("★★★★★★★★★★★★★★★★★★★★★");
        System.out.println(integerStringMap);


        List<AnswerDTO> newAnswerDTOList = new ArrayList<>();
        for (int i = 1; i < answerList.size() + 1; i++) {
            if (answerList.get(i - 1).equals(integerStringMap.get(i))) {
                AnswerDTO newAnswerDTO = new AnswerDTO();
                newAnswerDTO.setProblemId(integerStringMap.get(i).getId());
                newAnswerDTO.setMemberId(memberService.findByIdofmemberId((String) session.getAttribute("memberId")));
                newAnswerDTO.setResult(1);
                answerService.addResult(newAnswerDTO);
                newAnswerDTOList.add(newAnswerDTO);
            }else {
                AnswerDTO newAnswerDTO = new AnswerDTO();
                newAnswerDTO.setProblemId(integerStringMap.get(i).getId());
                newAnswerDTO.setMemberId(memberService.findByIdofmemberId((String) session.getAttribute("memberId")));
                newAnswerDTO.setResult(0);
                answerService.addResult(newAnswerDTO);
                newAnswerDTOList.add(newAnswerDTO);

            }
        }
model.addAttribute("newAnswerDTOList",newAnswerDTOList);
model.addAttribute("integerStringMap",integerStringMap);

            return "ProblemResult";
    }
}
