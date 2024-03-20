<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>  
<%@ page import="java.time.*" %>
 
<%
    request.setCharacterEncoding("utf-8");

    // 양식에 입력되었던 값 읽기
    int memberno  = Integer.parseInt(request.getParameter("memberno" ));
    String title   = request.getParameter("title"  );
    String content = request.getParameter("content");

    // 빈 칸이 하나라도 있으면 오류 출력하고 종료
    if (memberno <= 0 ||
        title   == null || title.length()   == 0 ||
        content == null || content.length() == 0) {
%>      
        <script>
            alert('모든 항목이 빈칸 없이 입력되어야 합니다.');
            history.back();
        </script>
<%        
        return;
    }

    String memberId = (String)session.getAttribute("userName");
	if (memberId == null) {
		response.sendRedirect("login_main.jsp");
	} 
    BoardDao dao = BoardDao.getInstance();
   // Board board = new Board(memberno, title, content);
    Board board = new Board(0, memberno, title, content, "", 0);
    board.setMemberno(memberno);
    board.setTitle(title);
    board.setContent(content);
    dao.insert(board);
    // 목록보기 화면으로 돌아감
    response.sendRedirect("list.jsp");
%>     