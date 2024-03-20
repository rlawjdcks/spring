<%@page import="dto.Member"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%
    // 글 번호 값 얻기, 주어지지 않았으면 0으로 설정
    String tmp = request.getParameter("num");
    int num = (tmp != null && tmp.length() > 0) ? Integer.parseInt(tmp) : 0;

    // 새 글쓰기 모드를 가정하고 변수 초기값 설정
                

	Member member = (Member) session.getAttribute("member");
    String title = "";
    String content = "";
    String action = "insert.jsp";
	
    // 글 번호가 주어졌으면, 글 수정 모드
    if (num > 0) {
        BoardDao dao = BoardDao.getInstance();
        Board board = dao.selectOne(num, false);
	
        // 글 데이터를 변수에 저장
        title = board.getTitle();
        content = board.getContent();

        // 글 수정 모드일 때는 저장 버튼을 누르면 UPDATE 실행
        action = "update.jsp?num=" + num;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/write.css">
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyLcR+AJdhkD5i/Cv5MIT+twDk24O5c9Mp" crossorigin="anonymous">
    <style>
        body {
            background-color: #3498db; /* Blue color */
            color: white;
        }

        form {
            margin: 50px auto;
            width: 50%;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
        }

        th, td {
            padding: 10px;
            color: black;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            box-sizing: border-box;
        }

        input[type="submit"], input[type="button"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }

        input[type="submit"]:hover, input[type="button"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <form method="post" action="<%=action%>">
        <table>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" maxlength="80" value="<%=title%>"></td>
            </tr>
            <tr>
                <th>회원번호</th>
                <td><input type="text" readonly name="memberno" maxlength="20" value="<%=member.getMemberno()%>"> </td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="content" rows="10"><%=content%></textarea></td>
            </tr>
        </table>

        <br>
        <input type="submit" value="저장" class="btn btn-success">
        <input type="button" value="취소" onclick="history.back()" class="btn btn-secondary">
    </form>
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
