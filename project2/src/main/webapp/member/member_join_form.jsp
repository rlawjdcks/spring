<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>회원가입</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyLcR+AJdhkD5i/Cv5MIT+twDk24O5c9Mp" crossorigin="anonymous">
   <link rel="stylesheet" type="text/css" href="../css/member_join_form.css">
    <style>
        body {
            background-color: #3498db; /* Blue color */
            color: white;
        }

        .form-title {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .form-group label {
            font-size: 18px;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h2 class="form-title">회원가입</h2>
    <form action="member_join.jsp" method="post">
        <div class="form-group row">
            <label for="id" class="col-sm-2 col-form-label">아이디</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요">
            </div>
        </div>
        <div class="form-group row">
            <label for="pw" class="col-sm-2 col-form-label">메일</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="pw" name="pw" placeholder="메일을 입력하세요">
            </div>
        </div>
        <div class="form-group row">
            <label for="name" class="col-sm-2 col-form-label">이름</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요">
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-10 offset-sm-2">
                <button type="submit" class="btn btn-primary">등록</button>
            </div>
        </div>
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
