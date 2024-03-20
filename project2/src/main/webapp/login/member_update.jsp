<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("utf-8");

	Member member = new Member(request.getParameter("id"),
							request.getParameter("pw"),
							request.getParameter("name"));
	MemberDao.getInstance().update(member);
    
       
    // 사용자 이름을 담은 세션 속성도 업데이트
    // 아이디는 바뀌지 않지만, 사용자 이름은 바뀔 수 있기 때문임
    session.setAttribute("userName", request.getParameter("name"));
     
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>

<script>
    window.location.href = "../index.jsp"
</script>

</body>
</html>