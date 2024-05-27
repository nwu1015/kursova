<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin Page. Edit element</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
</head>
<body>
<form action="elements" method="post" class="basket-form">
    <input type="hidden" name="id" value="${element.id}">
    <input type="hidden" name="command" value="save">

    <h2 class="text-title">РЕДАГУВАННЯ ЕЛЕМЕНТА:</h2>
    <div class="input-group-basket">
        <label class="label-basket">Ім'я</label>
        <input type="text" class="input-basket" name="name" value="<c:out value="${element.name}"/>">
    </div>
    <div class="input-group-basket">
        <label class="label-basket">Опис</label>
        <input type="text" class="input-basket" name="description" value="<c:out value="${element.description}"/>">
    </div>
    <div class="input-group-basket">
        <label class="label-basket">Ціна</label>
        <input type="text" class="input-basket" name="price" value="<c:out value="${element.price}"/>">
    </div>
    <div class="input-group-basket">
        <label class="label-basket">Шлях до картинки</label>
        <input type="text" class="input-basket" name="picture" value="<c:out value="${element.picture}"/>">
    </div>
    <div class="input-group-basket">
        <input type="submit" class="basket-admin-button" value="Save"/>
    </div>
</form>
</body>
</html>
