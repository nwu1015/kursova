<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
</head>
<body>
<form action="elements" method="post">
  <input type="hidden" name="id" value="${element.id}">
  <input type="hidden" name="command" value="save">
  Name: <input type="text" name="name" value="<c:out value="${element.name}"/>"> <br>
  Description: <input type="text" name="description" value="<c:out value="${element.description}"/>"><br>
  Price: <input type="text" name="price" value="<c:out value="${element.price}"/>"><br>
  Picture: <input type="text" name="picture" value="<c:out value="${element.picture}"/>"><br>
  <input type="submit" value="Save">
</form>
</body>
</html>
