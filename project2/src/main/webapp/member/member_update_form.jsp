<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/member_update_form.css">
    <style>
        body {
            background-color: #3498db; /* Blue color */
            color: white;
        }
    </style>
</head>
<body>

<%
    request.setCharacterEncoding("utf-8");
	
	Member member = MemberDao.getInstance().select((String)session.getAttribute("userId"));
%>

<div class="container mt-5">
    <form action="member_update.jsp" method="post">
        <table class="table table-borderless text-white">
            <tr>
                <td>아이디</td>
                <td><input type="text" name="id" readonly class="form-control bg-primary text-white"
                           value="<%=member.getId()%>"></td>
            </tr>
            <tr>
                <td>메일</td>
                <td><input type="text" name="email" class="form-control" 
                           value="<%=member.getEmail()%>"></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" name="name" class="form-control" 
                           value="<%=member.getName()%>"></td>
            </tr>
        </table>    
        <input type="submit" value="저장" class="btn btn-light"> 
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
