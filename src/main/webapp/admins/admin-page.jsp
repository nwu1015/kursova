<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Neko Sushi. Admin page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <%@include file="/admins/admin-navigation.jspf"%>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <div class="content">
                <h1 class="text-title">ЕЛЕМЕНТИ МЕНЮ</h1>
            </div>
            <div class="content">
                <table class="basket-admin-table">
                    <tr>
                        <th>Id</th>
                        <th>Назва товару</th>
                        <th>Ціна (грн)</th>
                        <th>Опис</th>
                        <th>Шлях до картинки</th>
                        <th>Функціональна частина</th>
                    </tr>
                    <c:forEach var="element" items="${sessionScope.elements}">
                        <tr>
                            <td><c:out value="${element.id}"/></td>
                            <td><c:out value="${element.name}"/></td>
                            <td><c:out value="${element.price}"/></td>
                            <td><c:out value="${element.description}"/></td>
                            <td><c:out value="${element.picture}"/></td>
                            <td>
                                <form action="${pageContext.request.contextPath}/elements" method="get">
                                    <input type="submit" value="Edit" class="basket-admin-button">
                                    <input type="hidden" name="command" value="edit">
                                    <input type="hidden" name="id" value="${element.id}">
                                </form>
                                <br>
                                <form action="${pageContext.request.contextPath}/elements" method="post">
                                    <input type="hidden" name="command" value="delete">
                                    <input type="submit" value="Delete" class="basket-admin-button">
                                    <input type="hidden" name="id" value="${element.id}">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="content">
                <h1 class="text-title">ДОДАТИ НОВУ СТРАВУ</h1>
            </div>
            <div class="content">
                <form action="${pageContext.request.contextPath}/elements" method="post">
                    <input type="hidden" name="command" value="create">
                    <div class="input-group-basket">
                        <label class="label-basket">Ім'я</label>
                        <input autocomplete="off" name="name" class="input-basket" type="text">
                    </div>
                    <div class="input-group-basket">
                        <label class="label-basket">Опис</label>
                        <input autocomplete="off" name="description" class="input-basket" type="text">
                    </div>
                    <div class="input-group-basket">
                        <label class="label-basket">Ціна (грн)</label>
                        <input autocomplete="off" name="price" class="input-basket" type="text">
                    </div>
                    <div class="input-group-basket">
                        <label class="label-basket">Шлях до картинки</label>
                        <input autocomplete="off" name="picture" class="input-basket" type="text">
                    </div>
                    <div class="input-group-basket">
                        <button class="basket-admin-button" type="submit" value="Add" style="width: 75%;">Підтвердити</button>
                    </div>
                </form>
            </div>
        </main>
    </div>
</div>
</body>
</html>