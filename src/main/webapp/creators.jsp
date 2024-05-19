<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

</head>
<body>
<%@include file="WEB-INF/components/header.jspf"%>
<style>

    .creators{
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
    }

    .card-creator {
        box-sizing: border-box;
        width: 190px;
        height: 254px;
        background: rgba(217, 217, 217, 0.58);
        border: 1px solid white;
        box-shadow: 12px 17px 51px rgba(0, 0, 0, 0.22);
        backdrop-filter: blur(6px);
        border-radius: 17px;
        text-align: center;
        cursor: pointer;
        transition: all 0.5s;
        display: flex;
        align-items: center;
        justify-content: center;
        user-select: none;
        font-weight: bolder;
        color: black;
        margin: 50px 20px; /* змінено маржін */
        overflow: hidden; /* додано властивість overflow */
    }

    .card-creator:hover {
        border: 1px solid black;
        transform: scale(1.05);
    }

    .card-creator:active {
        transform: scale(0.95) rotateZ(1.7deg);
    }

</style>
<div class="creators">
    <div class="card-creator">
        Марченко Вадим Олександрович
        <br>
        <ul>
            <li>Основний виконавець роботи</li>
        </ul>
    </div>

    <div class="card-creator">
        Савел’єва Олександра
        <br>
        <ul>
            <li>Дизайнер сторінки</li>
        </ul>
    </div>
</div>
<%@include file="WEB-INF/components/footer.jspf"%>
</body>
</html>
