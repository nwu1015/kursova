package com.example.kursova.controllers;

import java.io.*;
import java.util.*;

import com.example.kursova.model.Element;
import com.example.kursova.model.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

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

        String name = request.getParameter("Name");
        String city = request.getParameter("City");
        String address = request.getParameter("Adress");
        String house = request.getParameter("House");
        String flat = request.getParameter("Flat");
        String date = request.getParameter("Date");
        String time = request.getParameter("Time");
        String phone = request.getParameter("Phone");
        String email = request.getParameter("Email");

        List<Element> basket = (List<Element>) session.getAttribute("basket");
        if (basket == null || basket.isEmpty()) {
            response.sendRedirect("basket.jsp");
            return;
        }

        Order order = new Order(name, city, address, house, flat, date, time, phone, email, new ArrayList<>(basket));

        List<Order> orders = (List<Order>) session.getAttribute("orders");
        if (orders == null) {
            orders = new ArrayList<>();
        }

        orders.add(order);
        session.setAttribute("orders", orders);
        session.removeAttribute("basket");
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