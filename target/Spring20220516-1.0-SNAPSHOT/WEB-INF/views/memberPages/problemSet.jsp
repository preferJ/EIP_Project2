<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-17
  Time: 오전 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            background-image: url("../../../resources/img/seo-2394237.jpg");
        }

        .mainBox {
            margin-right: auto;
            margin-left: auto;
            text-align: center;
            background-color: white;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<BR><BR><BR><BR><BR>
<div class="mainBox">
    <form action="/problem/startSet" method="post">
        <select name="problemYear" id="problemYear">
            <option value="2022">2022</option>
            <option value="2021">2021</option>
            <option value="2019">2019</option>
            <option value="2018">2018</option>
            <option value="2017">2017</option>
        </select>

        <select name="problemSubject" id="problemSubject">
            <option value="1과목">1과목</option>
            <option value="2과목">2과목</option>
            <option value="3과목">3과목</option>
            <option value="4과목">4과목</option>
            <option value="5과목">5과목</option>
            <option value="6과목">6과목</option>
            <option value="7과목">7과목</option>
        </select>

        틀린 문제<input type="checkbox" name="problemWrong" id="problemWrong" value="problemWrong">
        체크한 문제<input type="checkbox" name="problemCheck" id="problemCheck" value="problemCheck">
        <button>문제 풀기</button>

    </form>
</div>

</body>
</html>
