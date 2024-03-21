<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Member</title>
</head>
<body>
    <h1>Delete Member</h1>
    <form action="/delete" method="post">
		<input type="hidden" name="id" value="<%= request.getParameter("id") %>">
        <input type="submit" value="Submit">
        <h1> 하나 둘 </h1>
    </form>
</body>
</html>
