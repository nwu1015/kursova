package com.example.kursova.controllers;
import java.io.*;
import java.util.Collection;

import com.example.kursova.dao.ElementDao;
import com.example.kursova.model.Element;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "AddToBasketController", value = {"/buy"})
public class AddToBasketController extends HttpServlet {
    private ElementDao elementDao;

    @Override
    public void init() throws ServletException {
        super.init();
        elementDao = (ElementDao) getServletContext().getAttribute("elementDao");
        if (elementDao == null) {
            throw new ServletException("ElementDao не ініціалізований у контексті сервлета.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String purchase = req.getParameter("purchase");
        if(purchase == null){
            resp.sendError(400, "Щось пішло не так! Перегляньте коректність введених даних/ваших дій");
            return;
        }

        switch (purchase){
            case "addToBasket":
                addToBasket(req, resp);
                break;
            default: resp.sendError(400, "Щось пішло не так! Перегляньте коректність введеної команди");
        }
    }

    private void addToBasket(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        try {
            Integer id = Integer.valueOf(req.getParameter("id"));
            String name = req.getParameter("name");
            String description = req.getParameter("description");
            Integer price = Integer.valueOf(req.getParameter("price"));
            String picture = req.getParameter("picture");

            Element element = new Element(id, name, description, price, picture);

            req.setAttribute("element", element);

            req.getRequestDispatcher("admins/admin-page.jsp").forward(req, resp);

        } catch (Exception e){
            resp.sendError(400);
        }
    }
}
