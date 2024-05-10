<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Neko Sushi. Basket</title>
    <link rel="stylesheet" type="text/css" href="styles/style.css">

</head>
<body>
<%@include file="header.jspf"%>

<h1 class="text-title">КОРЗИНА</h1>

<br>

<h2 class="text-title">Замовлення в корзині:</h2>
<table class="purchases">
    <tr>
        <th>Назва товару</th>
        <th>Кількість</th>
        <th>Ціна за 1 набір (грн)</th>
        <th>Ціна (грн)</th>
    </tr>
    <tr>
        <td>Піца</td>
        <td><input autocomplete="off" name="Number-of-sets" class="number-of-sets" type="number" min="1" oninput="validity.valid||(value='');" placeholder="Оберіть кількість наборів"></td>
        <td>100 грн</td>
        <td>200 грн</td>
    </tr>
    <tr>
        <td>Гамбургер</td>
        <td>1</td>
        <td>50 грн</td>
        <td>50 грн</td>
    </tr>
    <tr>
        <td>Салат</td>
        <td>1</td>
        <td>30 грн</td>
        <td>30 грн</td>
    </tr>
</table>

<h2 class="text-title">Оформлення замовлення:</h2>

<form class="confirm-purchase">
    <input type="text" placeholder="Введіть ваше ім'я">
    <input type="text" placeholder="Введіть ваше місто">
    <input type="text" placeholder="Введіть вулицю проживання"> <input type="text" placeholder="Будинок"> <input type="text" placeholder="Квартира">
    <input type="number" placeholder="Введіть ваш номер телефону">
</form>
<%@include file="footer.jspf"%>
</body>
</html>
