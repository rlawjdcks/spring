<%@page import="dto.Member"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

<%
    int num = Integer.parseInt(request.getParameter("num")); 
	Member member = (Member) session.getAttribute("member");

    String memberId = (String)session.getAttribute("userName");
    if (memberId == null) {
        response.sendRedirect("login_main.jsp");
    } 
    BoardDao dao = BoardDao.getInstance();
    Board board = dao.selectOne(num, true);

    int memberno  = board.getMemberno();
    String title   = board.getTitle();
    String content = board.getContent();
    String regtime = board.getRegtime();
    int hits       = board.getHits();
	int boardAuthorNo = board.getMemberno();

    title   = title.replace  (" ", "&nbsp;");
    content = content.replace(" ", "&nbsp;").replace("\n", "<br>");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>게시글 보기</title>
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyLcR+AJdhkD5i/Cv5MIT+twDk24O5c9Mp" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../css/view.css">
    <style>
        body {
            background-color: #3498db; /* Blue color */
            color: white;
        }

th, td {
		    padding: 10px;
		    color: black; /* 변경된 부분: 글자 색을 검정색으로 지정 */
		}
        .container {
            margin: 50px auto;
            width: 60%;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>게시글 보기</h2>
    <table class="table">
        <tr>
            <th>제목</th>
            <td><%=title%></td>
        </tr>
        <tr>
            <th>작성자번호</th>
            <td><%=memberno%></td>
        </tr>
        <tr>
            <th>작성일시</th>
            <td><%=regtime%></td>
        </tr>
        <tr>
            <th>조회수</th>
            <td><%=hits%></td>
        </tr>
        <tr>
            <th>내용</th>
            <td><%=content%></td>
        </tr>
    </table>

    <br>
    <input type="button" value="목록보기" onclick="location.href='list.jsp'">
 <%        if (member != null && member.getMemberno() == boardAuthorNo) { %>
    <!-- 수정 버튼 -->
    <input type="button" value="수정" onclick="location.href='write.jsp?num=<%=num%>'">
    <!-- 삭제 버튼 -->
    <input type="button" value="삭제" onclick="location.href='delete.jsp?num=<%=num%>'">
<%
    }
%>
</div>

<!-- 부트스트랩 스크립트 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
    integrity="sha384-eMNCO6QAeL0wF5zF8yZDR4z5OBIbhahBuGqHf84zDt7DtzlMRpnG9a2W6I5dQyXg"
    crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
    integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyLcR+AJdhkD5i/Cv5MIT+twDk24O5c9Mp"
    crossorigin="anonymous"></script>
</body>
</html>
