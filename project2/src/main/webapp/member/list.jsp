<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%
    String memberId = (String)session.getAttribute("userName");
    if (memberId == null) {
        response.sendRedirect("login_main.jsp");
    } 
    BoardDao dao = BoardDao.getInstance();
    
    String searchKeyword = request.getParameter("searchKeyword");
    
    List<Board> list;
    if (searchKeyword != null && !searchKeyword.isEmpty()) {
        // 검색어가 있는 경우
        list = dao.searchList(searchKeyword);
    } else {
        // 검색어가 없는 경우 전체 글 목록을 가져옴
        list = dao.selectList();
    }
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="list.jsp">게시판</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp">로그아웃</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container" style="padding-top: 20px;">
        <form action="list.jsp" method="get" class="mb-3">
            <div class="input-group">
                <input type="text" class="form-control" name="searchKeyword" placeholder="검색어 입력">
                <button type="submit" class="btn btn-primary">검색</button>
            </div>
        </form>

        <table class="table table-bordered table-hover">
            <tr>
                <th class="num">번호</th>
                <th class="writer">회원번호</th>
                <th class="title">제목</th>
                <th class="regtime">작성일시</th>
                <th>조회수</th>
            </tr>
            <%
                for (Board board : list) {
            %>
            <tr>
                <td><%=board.getNum()%></td>
                <td><%=board.getMemberno()%></td>
                <td style="text-align:left;">
                    <a href="view.jsp?num=<%=board.getNum()%>">
                        <%=board.getTitle()%>
                    </a>
                </td>
                <td><%=board.getRegtime()%></td>
                <td><%=board.getHits()%></td>
            </tr>
            <%
                }
            %>
        </table>

        <br>
        <input type="button" value="글쓰기" class="btn btn-primary" onclick="location.href='write.jsp'">
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
