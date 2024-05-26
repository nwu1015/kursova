<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Neko Sushi. Basket</title>
</head>
<body>
<%@include file="header.jspf"%>

<h1 class="text-title">КОРЗИНА</h1>

<br>

<h2 class="text-title">Замовлення в корзині:</h2>

<form class="basket-form" action="updateBasket" method="post">
    <c:choose>
        <c:when test="${empty sessionScope.basket}">
            <p class="text-title">На жаль, у вас пустий кошик</p>
        </c:when>
        <c:otherwise>
            <table border="1" class="basket-admin-table">
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
            <div class="input-group-basket">
                <button class="basket-admin-button" type="submit" style="width: 75%;">Оновити таблицю</button>
            </div>
        </c:otherwise>
    </c:choose>
</form>


<form class="basket-form" action="submitForm" method="post">
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
        <label class="label-basket">Вкажіть адресу проживання</label>
        <input autocomplete="off" name="Adress" id="Adress" class="input-basket" type="text" placeholder="Вулиця">
        <input autocomplete="off" name="House" id="House" class="input-basket" type="text" placeholder="Будинок">
        <input autocomplete="off" name="Flat" id="Flat" class="input-basket" type="text" placeholder="Квартира">
    </div>
    <div class="input-group-basket">
        <label class="label-basket">Вкажіть дату та час доставки</label>
        <input autocomplete="off" name="Date" id="Date" class="input-basket" type="date" placeholder="Дата">
        <input autocomplete="off" name="Time" id="Time" class="input-basket" type="time" placeholder="Час">
    </div>
    <div class="input-group-basket">
        <label class="label-basket">Вкажіть ваш номер телефону</label>
        <input autocomplete="off" name="Phone" id="Phone" class="input-basket" type="tel" value="+38">
    </div>
    <div class="input-group-basket">
        <label class="label-basket">Електронна адреса</label>
        <input autocomplete="off" name="Email" id="Email" class="input-basket" type="email">
    </div>
    <div class="input-group-basket">
        <button class="basket-admin-button" type="submit" style="width: 75%;">Підтвердити</button>
    </div>
</form>


<%@include file="footer.jspf"%>

<script>
    document.getElementById('Phone').addEventListener('input', function (e) {
        const pattern = /^\+38\d*$/;
        const maxLength = 12;

        if (!pattern.test(e.target.value)) {
            e.target.value = e.target.value.slice(0, -1);
        }

        if (e.target.value.length > maxLength) {
            e.target.value = e.target.value.slice(0, maxLength);
        }

        if (e.target.value.length < 3) {
            e.target.value = '+38';
        }
    });

    document.getElementById('Phone').addEventListener('keydown', function (e) {
        if (e.key === 'Backspace' && e.target.value === '+38') {
            e.preventDefault();
        }
    });
</script>
</body>
</html>
