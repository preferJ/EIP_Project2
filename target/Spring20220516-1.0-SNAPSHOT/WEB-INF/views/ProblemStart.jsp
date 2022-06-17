<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-17
  Time: 오전 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <script src="http://code.jquery.com/jquery-3.6.0.js"></script>

    <style>
        body {
            background-image: url("../../resources/img/seo-2394237.jpg");
        }

        .mainBox {
            margin-right: auto;
            margin-left: 5%;
            text-align: center;
            background-color: white;
            width: 70%;
        }

        div, ul, li {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 0;
            margin: 0
        }

        a {
            text-decoration: none;
        }

        .quickmenu {
            position: absolute;
            width: auto;
            top: 50%;
            margin-top: -50px;
            right: 10px;
            background: #fff;
        }

        .quickmenu ul {
            position: relative;
            float: left;
            width: 100%;
            display: inline-block;
            *display: inline;
            border: 1px solid #ddd;
        }

        .quickmenu ul li {
            float: left;
            width: 100%;
            border-bottom: 1px solid #ddd;
            text-align: center;
            display: inline-block;
            *display: inline;
        }

        .quickmenu ul li a {
            position: relative;
            float: left;
            width: 100%;
            height: 30px;
            line-height: 30px;
            text-align: center;
            color: #999;
            font-size: 9.5pt;
        }

        .quickmenu ul li a:hover {
            color: #000;
        }

        .quickmenu ul li:last-child {
            border-bottom: 0;
        }

        .content {
            position: relative;
            min-height: 1000px;
        }


    </style>
</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
<BR><BR><BR><BR><BR>
<h1 style="background-color: white;text-align: center">문제 풀기</h1>
<h4 style="background-color: white;text-align: center">답 선택 : 숫자키 1~4 / 이전 문제 : backSpace / 체점 : Enter</h4>
<br><br>

<div class="quickmenu">
    <ul id="answer">
        <form action="/problem/submitAns" method="post">
        <table class="table">
            <input type="text" value="${integerStringMap}" name="Map" >
            <tr>
                <th>문제번호</th>
                <th> 정답</th>
            </tr>
            <c:forEach items="${integerStringMap}" var="problem">
                <tr>
                    <td>${problem.value.problemQNum}</td>
                    <td ><input style="width: 50px" type="text" id="${problem.key}ans" name="answerList"></td>
                </tr>
            </c:forEach>
        </table>
            <button type="submit" class="btn-dark">제출</button>
        </form>

    </ul>
</div>

<div class="mainBox" style="text-align: left">
    <c:forEach items="${integerStringMap}" var="problem">
        <div class="container" id="${problem.key}">
            <span>__________________________________________________________________________________________________________________________________________________________</span><br>
            <span>문제 년도 : ${problem.value.problemYear}</span><br>
            <span>과목 : ${problem.value.problemSubject}</span><br>
            <br><br>
            <div>${problem.value.problemQNum}. ${problem.value.problemQ}</div>
            <br>
            <div id="${problem.key}a">1. ${problem.value.problemA1}</div>
            <br>
            <div id="${problem.key}b">2. ${problem.value.problemA2}</div>
            <br>
            <div id="${problem.key}c">3. ${problem.value.problemA3}</div>
            <br>
            <div id="${problem.key}d">4. ${problem.value.problemA4}</div>
            <br>
            <br><br>
        </div>
    </c:forEach>
</div>
<button type="button" onclick="oncc()">테스트용</button>

<script>
    function oncc() {
        document.getElementById("1a").style.backgroundColor = "red";
    }

    $(document).ready(function () {
        var currentPosition = parseInt($(".quickmenu").css("top"));
        $(window).scroll(function () {
            var position = $(window).scrollTop();
            $(".quickmenu").stop().animate({"top": position + currentPosition + "px"}, 500);
        });
    });


    var a = 1
    var b = "";


    document.addEventListener("keydown", keyDownHandler, false);

    // document.addEventListener("keyup", keyUpHandler, false);

    function keyDownHandler(e) {
        if (a > 0 && a < "${integerStringMap.size()}" + 1) {
            if (e.keyCode == 49) {
                var bb = a + "a"
                var anan = a + "ans"
                document.getElementById(anan).value = "1";
                var menuHeight = document.getElementById(a).offsetHeight;
                var location = document.getElementById(a).offsetTop;
                document.getElementById(bb).style.backgroundColor = "green"
                window.scrollTo({top: location - 200, behavior: 'smooth'});
                a++;
                console.log(a)
            } else if (e.keyCode == 50) {
                var bb = a + "b"
                var anan = a + "ans"
                document.getElementById(anan).value = "2";
                var menuHeight = document.getElementById(a).offsetHeight;
                var location = document.getElementById(a).offsetTop;
                document.getElementById(bb).style.backgroundColor = "green"
                window.scrollTo({top: location - 200, behavior: 'smooth'});
                a++;
                console.log(a)
            } else if (e.keyCode == 51) {
                var bb = a + "c"
                var anan = a + "ans"
                document.getElementById(anan).value = "3";
                var menuHeight = document.getElementById(a).offsetHeight;
                var location = document.getElementById(a).offsetTop;
                document.getElementById(bb).style.backgroundColor = "green"
                window.scrollTo({top: location - 200, behavior: 'smooth'});
                a++;
                console.log(a)
            } else if (e.keyCode == 52) {
                var bb = a + "d"
                var anan = a + "ans"
                document.getElementById(anan).value = "4";
                var menuHeight = document.getElementById(a).offsetHeight;
                var location = document.getElementById(a).offsetTop;
                document.getElementById(bb).style.backgroundColor = "green"
                window.scrollTo({top: location - 200, behavior: 'smooth'});
                a++;
                console.log(a)
            } else if (e.keyCode == 8) {
                if (a > 2) {
                    a--;
                    var aa1 = a - 1;
                    var aa = String(aa1);
                    var bb1 = a + "a"
                    var bb2 = a + "b"
                    var bb3 = a + "c"
                    var bb4 = a + "d"
                    var anan = a + "ans"
                    document.getElementById(anan).value = "";
                    var menuHeight = document.getElementById(aa).offsetHeight;
                    var location = document.getElementById(aa).offsetTop;
                    document.getElementById(bb1).style.backgroundColor = "white"
                    document.getElementById(bb2).style.backgroundColor = "white"
                    document.getElementById(bb3).style.backgroundColor = "white"
                    document.getElementById(bb4).style.backgroundColor = "white"
                    window.scrollTo({top: location - 200, behavior: 'smooth'});
                    console.log(a)
                } else {
                    a = 1
                    document.getElementById("1ans").value = "";
                    document.getElementById("1a").style.backgroundColor = "white"
                    document.getElementById("1b").style.backgroundColor = "white"
                    document.getElementById("1c").style.backgroundColor = "white"
                    document.getElementById("1d").style.backgroundColor = "white"

                }
            }
        }

    }
</script>

</body>
</html>
