<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>   

<%
		MemberDao memberDao = MemberDao.getInstance();
        String id = request.getParameter("id");
        String email = request.getParameter("pw");
		Member member = memberDao.selectForLogin(id, email);
        // 그런 레코드가 있으면, 세션 속성을 등록하고, 메인 화면으로 돌아감
        if (member != null) {
            session.setAttribute("userId",   member.getId());
            session.setAttribute("userName", member.getName());
            session.setAttribute("userNo",  member.getMemberno());
            
            session.setAttribute("member", member);
            response.sendRedirect("../index.jsp");   
            return;
        }
        
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>

<script>
    alert('아이디 또는 비밀번호가 틀립니다!');
    history.back();
</script>
 
</body>
</html>
