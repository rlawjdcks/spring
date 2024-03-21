<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Member</title>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>
        function checkInt() {
            var ageValue = $('#age').val();
            if (isNaN(ageValue) || ageValue === "") {
                alert("숫자를 입력하세요.");
                event.preventDefault(); // 제출 중지
                return false; // 제출 중지
            }
            return true; // 유효한 입력이면 제출 허용
        }
    </script>
</head>
<body>
    <h1>Update Member</h1>
    <form action="/update" method="post" onsubmit="return checkInt(event)">
        <input type="hidden" name="id" value="${param.id}">
        <label>Name: </label><input type="text" name="name"><br>
        <label>Age: </label><input type="text" name="age"><br>
        <label>Email: </label><input type="text" name="email" disabled><br>
        <label>Text: </label><input type="text" name="text"><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
