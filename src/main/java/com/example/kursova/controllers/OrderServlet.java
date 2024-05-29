package com.example.kursova.controllers;

import java.io.*;
import java.util.*;

import com.example.kursova.model.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "OrderServlet", urlPatterns = {"/deleteOrder"})
public class OrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            HttpSession session = request.getSession();
            List<Order> orders = (List<Order>) session.getAttribute("orders");

            if (orders != null && orderId >= 0 && orderId < orders.size()) {
                orders.remove(orderId);
                session.setAttribute("orders", orders);
            }

            response.sendRedirect("admins/admin-orders.jsp");
        } catch (Exception e) {
            response.sendError(400, "Некоректне ID замовлення");
        }
    }
}