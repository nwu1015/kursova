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
</table>

<c:if test="${not empty sessionScope.cart}">
    <table>
        <thead>
        <tr>
            <th>Назва</th>
            <th>Опис</th>
            <th>Ціна</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="element" items="${sessionScope.cart}">
            <tr>
                <td><c:out value="${element.name}"/></td>
                <td><c:out value="${element.description}"/></td>
                <td><c:out value="${element.price}"/> грн</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
<c:if test="${empty sessionScope.cart}">
    <p>Ваш кошик порожній</p>
</c:if>

<h2 class="text-title">Оформлення замовлення:</h2>

<form class="confirm-purchase">
    <br>
    <div class="input-group-basket">
        <label class="label-basket">Ім'я</label>
        <input autocomplete="off" name="Name" id="Name" class="input-basket" type="text">
    </div>
    <br>

    <div class="input-group-basket">
        <label class="label-basket">Вкажіть ваше місто</label>
        <input autocomplete="off" name="City" id="City" class="input-basket" type="text">
    </div>
    <br>

    <div class="input-group-basket">
        <label class="label-basket">Вкажіть вулицю проживання</label>
        <input autocomplete="off" name="Adress" id="Adress" class="input-basket" type="text" placeholder="Вулиця">
        <br>
        <input autocomplete="off" name="House" id="House" class="input-basket" type="text" placeholder="Будинок">
        <br>
        <input autocomplete="off" name="Flat" id="Flat" class="input-basket" type="text" placeholder="Квартира">
    </div>
    <br>

    <div class="input-group-basket">
        <label class="label-basket">Вкажіть ваш номер телефону</label>
        <input autocomplete="off" name="Phone" id="Phone" class="input-basket" type="tel">
    </div>
    <br>

    <div class="input-group-basket">
        <label class="label-basket">Електронна адреса</label>
        <input autocomplete="off" name="Email" id="Email" class="input-basket" type="email">
    </div>
    <br>
    <div class="input-group-basket">
        <button type="submit" onclick="popup.showModal()">Підтвердити</button>
        <dialog id="popup">
            <form method="dialog">
                <p>test</p>
                <button type="button" onclick="popup.close()">OK</button>
            </form>
        </dialog>
    </div>
</form>


<%@include file="footer.jspf"%>
</body>
</html>
