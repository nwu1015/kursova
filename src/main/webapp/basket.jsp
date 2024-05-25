<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Neko Sushi. Basket</title>
    <link rel="stylesheet" type="text/css" href="styles/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

</head>
<body>
<%@include file="header.jspf"%>

<h1 class="text-title">КОРЗИНА</h1>

<br>

<h2 class="text-title">Замовлення в корзині:</h2>

<h1>Your Basket</h1>
<form class="basket-form" action="submitForm" method="post">
    <table border="1">
        <thead>
        <tr>
            <th>Назва товару</th>
            <th>Кількість</th>
            <th>Ціна за 1 набір (грн)</th>
            <th>Ціна (грн)</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="element" items="${sessionScope.basket}">
            <tr>
                <td>${element.name}</td>
                <td>
                    <input name="quantity_${element.id}"
                           type="number"
                           min="1"
                           value="${element.quantity}"
                           placeholder="Оберіть кількість наборів">
                </td>
                <td>${element.price}</td>
                <td>${element.price * element.quantity}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <button type="submit">Update Basket</button>
    <h2 class="text-title">Оформлення замовлення:</h2>
    <div class="input-group-basket">
        <label class="label-basket">Ім'я</label>
        <input autocomplete="off" name="Name" id="Name" class="input-basket" type="text">
    </div>
    <div class="input-group-basket">
        <label class="label-basket">Вкажіть ваше місто</label>
        <input autocomplete="off" name="City" id="City" class="input-basket" type="text">
    </div>
    <div class="input-group-basket">
        <label class="label-basket">Вкажіть вулицю проживання</label>
        <input autocomplete="off" name="Adress" id="Adress" class="input-basket" type="text" placeholder="Вулиця">
        <input autocomplete="off" name="House" id="House" class="input-basket" type="text" placeholder="Будинок">
        <input autocomplete="off" name="Flat" id="Flat" class="input-basket" type="text" placeholder="Квартира">
    </div>
    <div class="input-group-basket">
        <label class="label-basket">Вкажіть ваш номер телефону</label>
        <input autocomplete="off" name="Phone" id="Phone" class="input-basket" type="tel">
    </div>
    <div class="input-group-basket">
        <label class="label-basket">Електронна адреса</label>
        <input autocomplete="off" name="Email" id="Email" class="input-basket" type="email">
    </div>
    <div class="input-group-basket">
        <button type="submit">Підтвердити</button>
    </div>
</form>


<%@include file="footer.jspf"%>
</body>
</html>
