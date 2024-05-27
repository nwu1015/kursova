<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Neko Sushi</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<%@include file="/header.jspf"%>

<br>
<div class="content">
    <div class="text">
        <h1>
            <span class="highlight" style="text-decoration: underline; text-decoration-style: wavy;">すしん</span>
            <br/>
            a bowl of love from<br/>
            <span class="highlight">japanese cuisine</span><br/>
            for you
        </h1>
        <p>Ласкаво просимо до Neko Sushi, вашого місця, де смак традиційних японських страв зливається
            з унікальними смаками і атмосферою. В нашому ресторані ви зможете насолодитися аутентичними
            стравами, які приготовлені з найсвіжіших інгредієнтів і зібрані з найтоншими дотепами.
        </p>
        <p>
            Наші суші-шефи майстерно створюють кожен шматочок, додаючи відчуття
            японської традиції та гармонії в кожному кульках рису. Від класичних суш до
            найкращих ролів - ми пропонуємо різноманітність, щоб задовольнити ваші кулінарні побажання.
        </p>
        <p>
            Приходьте до Neko Sushi, щоб зануритися в атмосферу справжньої Японії, де кожен шматочок є
            шедевром смаку, а кожен візит - це подорож у світ японської кухні і культури.
        </p>
        <br>
        <button class="btn" onclick="window.location.href='menu.jsp'">Order now</button>
    </div>
    <div class="main-picture">
        <img src="${pageContext.request.contextPath}/images/mainPic.png"  alt="bowl"/>
    </div>
</div>

<br>
<%@include file="/footer.jspf"%>
</body>
</html>