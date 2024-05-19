package com.example.kursova.controllers;


import java.io.*;
import java.util.Collection;

import com.example.kursova.dao.ElementDao;
import com.example.kursova.model.Element;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "ElementController", value = {"/elements", "/index.jsp"})
public class ElementController extends HttpServlet{
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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Collection<Element> elements = elementDao.findAll();
        req.setAttribute("elements", elements);
        req.getRequestDispatcher("jsp/title.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
