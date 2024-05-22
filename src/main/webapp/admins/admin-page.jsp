<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <nav class="col-md-3 col-lg-2 d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">
                            Елементи меню
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            Замовлення
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">
                            На головну сторінку
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../logout">
                            Вийти
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 id="greeting">Вітаю вас на адмін сторінці, <%=request.getRemoteUser()%>!</h1>
            </div>
            <div class="content">
                <h1 class="text-title">ЕЛЕМЕНТИ МЕНЮ</h1>
            </div>
            <div class="content">
                <table class="purchases">
                    <tr>
                        <th>Id</th>
                        <th>Назва товару</th>
                        <th>Ціна (грн)</th>
                        <th>Опис</th>
                        <th>Шлях до картинки</th>
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
                                    <input type="submit" value="Edit">
                                    <input type="hidden" name="command" value="edit">
                                    <input type="hidden" name="id" value="${element.id}">
                                </form>
                            </td>
                            <td>
                                <form action="${pageContext.request.contextPath}/elements" method="post">
                                    <input type="hidden" name="command" value="delete">
                                    <input type="submit" value="Delete"/>
                                    <input type="hidden" name="id" value="${element.id}">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="content">
                <form action="${pageContext.request.contextPath}/elements" method="post">
                    <input type="hidden" name="command" value="create">
                    Name: <input type="text" name="name" value=""> <br>
                    Description: <input type="text" name="description" value=""><br>
                    Price: <input type="text" name="price" value=""><br>
                    Picture: <input type="text" name="picture" value=""><br>
                    <input type="submit" value="Add">
                </form>
            </div>
        </main>
    </div>
</div>


</body>
</html>
