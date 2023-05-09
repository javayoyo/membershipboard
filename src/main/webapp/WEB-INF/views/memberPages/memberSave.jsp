<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-09
  Time: 오후 3:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>


</head>
<body>
<%@include file="../component/header.jsp"%>
<%@include file="../component/nav.jsp"%>
<div id = "section">

    <form action="/member/save" method="post" enctype="multipart/form-data">
        <input type="text" name="memberEmail" placeholder="이메일을 입력하세요" id="member-email" onblur="email_check()"> <br>
        <p id="check-result"></p>
        <input type="text" name="memberPassword" placeholder="비밀번호를 입력하세요"> <br>
        <input type="text" name="memberName" placeholder="이름을 입력하세요"> <br>
        <input type="text" name="memberMobile" placeholder="전화번호를 입력하세요"> <br>

        <input type="file" name="boardFile"> <br>
        <input type="submit" value="가입">
    </form>
</div>

<%@include file="../component/footer.jsp"%>

</body>
<script>
    const email_check = () => {
        const email = document.getElementById("member-email").value;
        const result = document.getElementById("check-result");
        $.ajax({
            type: "post",
            url: "/email-check",
            data: {
                "memberEmail": email
            },
            success: function () {
                result.innerHTML = "사용가능한 이메일입니다.";
                result.style.color = "green";
            },
            error: function () {
                result.innerHTML = "이미 사용 중인 이메일입니다.";
                result.style.color = "red";
            }
        });
    }

</script>
</html>
