package com.springex.springex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springex.springex.dto.Member;
import com.springex.springex.service.MemberService;

@Controller
public class MyController {

    @Autowired
    private MemberService memberService;
    
    @GetMapping("/")
    public String root() {
        System.out.println(memberService.getMemberCount());
        return "root";
    }
    
    @GetMapping("/members")
    public String showMembers(Model model) {
        List<Member> members = memberService.getAllMembers();
        model.addAttribute("members", members);
        return "members";
    }
    
    @PostMapping("/add")
    public String addMember(@RequestParam("name") String name, 
                            @RequestParam("age") int age, 
                            @RequestParam("email") String email,
                            @RequestParam("text") String text) {
        Member member = new Member(name, age, email, text);
        memberService.addMember(member);
        return "redirect:/members"; // 회원 목록 페이지로 리다이렉트
    }
    
    @GetMapping("/add")
    public String showAddForm() {
        return "addForm"; // 회원 추가 폼 페이지로 이동
    }
    
    @PostMapping("/update")
    public String modifyMember(@RequestParam("id") int id,
                               @RequestParam("name") String name, 
                               @RequestParam("age") int age, 
                               @RequestParam("email") String email,
                               @RequestParam("text") String text) {
        Member member = new Member(id, name, age, email, text);
        memberService.modifyMember(member);
        return "redirect:/members"; // 회원 목록 페이지로 리다이렉트
    }
    
    @GetMapping("/update")
    public String showUpdateForm() {
        return "updateForm"; // 회원 수정 폼 페이지로 이동
    }
    
    
    @PostMapping("/delete")
    public String removeMember(@RequestParam("id") int id) {
        Member member = new Member(id);
        member.setId(id);
        memberService.removeMember(member);
        return "redirect:/members"; // 회원 목록 페이지로 리다이렉트
    }
    @GetMapping("/delete")
    public String showDeleteForm(@RequestParam("id") int id, Model model) {
        model.addAttribute("id", id);
        return "delete-form"; // 삭제 폼을 보여주는 뷰로 리턴
    }


}
