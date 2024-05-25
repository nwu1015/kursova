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


<h1 id="menu" class="text-title">МЕНЮ</h1>
<br>

<div class="card-container-wrapper">
    <c:forEach var="element" items="${sessionScope.elements}">
        <div class="card-container">
            <div class="card">
                <div class="card-image">
                    <img src="<c:out value="${element.picture}"/>">
                    <img src="${pageContext.request.contextPath}/images/california-poppies.png">
                </div>
                <h1><c:out value="${element.name}"/></h1>
                <p><c:out value="${element.description}"/></p>
                <div class="price-and-button">
                    <h2><c:out value="${element.price}"/> грн</h2>

                    <form action="${pageContext.request.contextPath}/elements" method="post">
                        <input type="hidden" name="id" value="${element.id}">
                        <input type="hidden" name="command" value="addToBasket">
                        <button type="submit">
                            <i class="fa fa-shopping-basket"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </c:forEach>
</div>



<br>



<%@include file="/footer.jspf"%>




</body>
</html>