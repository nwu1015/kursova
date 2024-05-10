<%@ page import="java.io.*,java.util.*" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if(username.equals("admin") && password.equals("qwerty")) {
        // Якщо вірно, перенаправити на іншу сторінку
        response.sendRedirect("admin-page.jsp");
    } else {
        // Якщо невірно, перенаправити на сторінку помилки
        response.sendRedirect("login-error.jsp");
    }
%>