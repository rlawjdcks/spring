<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Member</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>
        function checkInt() {
            var ageValue = $('#age').val();
            if (isNaN(ageValue) || ageValue === "") {
                alert("숫자를 입력하세요.");
                event.preventDefault(); // 제출 중지
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <h1>Add Member</h1>
    <form action="/add" method="post" onsubmit="return checkInt(event)"S>
        <label>Name: </label><input type="text" name="name"><br>
        <label>Age: </label><input type="text" name="age"><br>
        <label>Email: </label><input type="text" name="email"><br>
        <label>Text: </label><input type="text" name="text"><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
