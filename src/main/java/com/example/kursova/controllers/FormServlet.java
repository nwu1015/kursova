package com.example.kursova.controllers;

import java.io.*;
import java.util.Collection;
import java.util.*;

import com.example.kursova.dao.ElementDao;
import com.example.kursova.model.Element;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "FormServlet", urlPatterns = {"/submitForm"})
public class FormServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Отримання даних з форми
        String name = request.getParameter("Name");
        String city = request.getParameter("City");
        String address = request.getParameter("Adress");
        String house = request.getParameter("House");
        String flat = request.getParameter("Flat");
        String phone = request.getParameter("Phone");
        String email = request.getParameter("Email");

        // Отримання даних кошика
        HttpSession session = request.getSession();
        List<Element> basket = (List<Element>) session.getAttribute("basket");

        if (basket != null) {
            for (Element element : basket) {
                String param = request.getParameter("quantity_" + element.getId());
                if (param != null) {
                    try {
                        int quantity = Integer.parseInt(param);
                        element.setQuantity(quantity);
                    } catch (NumberFormatException e) {
                        response.sendError(400, "Invalid quantity format for element ID: " + element.getId());
                        return;
                    }
                }
            }
        }

        // Зберігання даних у сесії
        session.setAttribute("name", name);
        session.setAttribute("city", city);
        session.setAttribute("address", address);
        session.setAttribute("house", house);
        session.setAttribute("flat", flat);
        session.setAttribute("phone", phone);
        session.setAttribute("email", email);
        session.setAttribute("basket", basket);

        // Перенаправлення на сторінку підтвердження
        response.sendRedirect("basket.jsp");
    }
}