package com.springex.springex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springex.springex.dao.MemberDao;
import com.springex.springex.dto.Member;

@Service
public class MemberService {

    @Autowired
    private MemberDao memberDao;

    public List<Member> getAllMembers() {
        return memberDao.selectAll();
    }

    public int getMemberCount() {
        return memberDao.count();
    }

    public void addMember(Member member) {
        memberDao.insert2(member);
    }
    
    public void modifyMember(Member member) {
    	memberDao.update(member);
    }
    
    public void removeMember(Member member) {
    	memberDao.delete(member);
    }
    
}
