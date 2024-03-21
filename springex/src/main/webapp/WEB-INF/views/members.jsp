<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Members List</title>
<style>
    /* 버튼 스타일 */
    .add-button {
        display: inline-block;
        padding: 10px 20px;
        background-color: #4CAF50;
        color: white;
        text-align: center;
        text-decoration: none;
        font-size: 16px;
        border-radius: 5px;
        border: none;
        cursor: pointer;
    }
    .add-button:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
<h1>Members List</h1>
<table border="1">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Email</th>
            <th>Text</th>
            <th colspan="2">Actons</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${members}" var="member">
            <tr>
                <td>${member.id}</td>
                <td>${member.name}</td>
                <td>${member.age}</td>
                <td>${member.email}</td>
                <td>${member.text}</td>
                <td><a href="/update?id=${member.id}" class="add-button">edit</a></td>
				<td><a href="/delete?id=${member.id}" class="add-button">delete</a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<a href="/add" class="add-button">Add Member</a>
</body>
</html>
