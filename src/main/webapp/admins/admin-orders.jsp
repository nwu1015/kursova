<%--
  Created by IntelliJ IDEA.
  User: Comfy
  Date: 26.05.2024
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <%@include file="/admins/admin-navigation.jspf"%>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <div class="content">
                <h1 class="text-title">ЗАМОВЛЕННЯ КЛІЄНТІВ</h1>
            </div>
            <div class="content-order">
                <c:forEach var="order" items="${sessionScope.orders}" varStatus="orderStatus">
                    <table border="1" class="basket-admin-table">
                        <thead>
                        <tr>
                            <th>Інформація про клієнта</th>
                            <th>Адреса доставки</th>
                            <th>Дата та час доставки</th>
                            <th>Електронна адреса</th>
                            <th>Назва товару</th>
                            <th>Кількість</th>
                            <th>Ціна за 1 набір (грн)</th>
                            <th>Ціна (грн)</th>
                            <th>Дії</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="element" items="${order.basket}" varStatus="status">
                            <tr>
                                <c:if test="${status.first}">
                                    <td rowspan="${order.basket.size()}">Ім'я: ${order.name}<br>Телефон: ${order.phone}</td>
                                    <td rowspan="${order.basket.size()}">м. ${order.city}. Адреса: ${order.address}, Будинок: ${order.house}, Квартира: ${order.flat}</td>
                                    <td rowspan="${order.basket.size()}">Час доставки: ${order.date}, ${order.time}</td>
                                    <td rowspan="${order.basket.size()}">${order.email}</td>
                                </c:if>
                                <td>${element.name}</td>
                                <td>${element.quantity}</td>
                                <td>${element.price}</td>
                                <td>${element.price * element.quantity}</td>
                                <c:if test="${status.first}">
                                    <td rowspan="${order.basket.size()}">
                                        <form action="${pageContext.request.contextPath}/deleteOrder" method="post">
                                            <input type="hidden" name="orderId" value="${status.index}">
                                            <input type="submit" value="Delete" class="basket-admin-button">
                                        </form>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>


                        </tbody>
                    </table>
                    <hr>
                </c:forEach>
            </div>
        </main>
    </div>
</div>
</body>
</html>
