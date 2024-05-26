package com.example.kursova.controllers;

import java.io.*;
import java.util.*;

import com.example.kursova.model.Element;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import  com.example.kursova.model.Order;

@WebServlet(name = "BasketServlet", urlPatterns = {"/updateBasket", "/submitForm", "/deleteOrder"})
public class BasketServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        if ("/updateBasket".equals(action)) {
            updateBasket(request, response);
        } else if ("/submitForm".equals(action)) {
            submitForm(request, response);
        } else if ("/deleteOrder".equals(action)) {
            deleteOrder(request, response);
        }
    }

    private void updateBasket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Element> basket = (List<Element>) session.getAttribute("basket");

        if (basket != null) {
            for (Element element : basket) {
                String quantityParam = request.getParameter("quantity_" + element.getId());
                if (quantityParam != null) {
                    int quantity = Integer.parseInt(quantityParam);
                    element.setQuantity(quantity);
                }
            }
        }

        session.setAttribute("basket", basket);
        response.sendRedirect("basket.jsp");
    }

    private void submitForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Отримання даних з форми
        String name = request.getParameter("Name");
        String city = request.getParameter("City");
        String address = request.getParameter("Adress");
        String house = request.getParameter("House");
        String flat = request.getParameter("Flat");
        String date = request.getParameter("Date");
        String time = request.getParameter("Time");
        String phone = request.getParameter("Phone");
        String email = request.getParameter("Email");

        // Отримання даних кошика
        List<Element> basket = (List<Element>) session.getAttribute("basket");
        if (basket == null || basket.isEmpty()) {
            response.sendRedirect("basket.jsp");
            return;
        }

        // Створення нового замовлення
        Order order = new Order(name, city, address, house, flat, date, time, phone, email, new ArrayList<>(basket));

        // Отримання списку замовлень із сесії або створення нового списку, якщо його ще немає
        List<Order> orders = (List<Order>) session.getAttribute("orders");
        if (orders == null) {
            orders = new ArrayList<>();
        }

        // Додавання нового замовлення до списку
        orders.add(order);

        // Оновлення атрибута сесії
        session.setAttribute("orders", orders);

        // Очищення кошика
        session.removeAttribute("basket");

        // Повернення на сторінку кошика
        response.sendRedirect("basket.jsp");
    }

    private void deleteOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            response.sendError(400, "Invalid order ID");
        }
    }
}