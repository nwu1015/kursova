<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="styles/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="body-login">

<form class="form" action="loginCheck.jsp" method="post">
    <h1>Вітаємо!</h1>
    <p>Введіть ваші дані, щоб отримати доступ до адмін-сторінки</p>

    <div class="input-wrapper">
        <input type="text" placeholder="Введіть ваш логін" id="username" name="username">
        <i class="fa fa-user-circle"></i>
    </div>

    <div class="input-wrapper">
        <input type="password" placeholder="Введіть ваш пароль" id="password" name="password">
        <i class="fa fa-key"></i>
    </div>

    <div>
        <button type="submit">
        Sign in
        <i class="fa fa-unlock-alt"></i> </button>
    </div>
</form>

</body>
</html>