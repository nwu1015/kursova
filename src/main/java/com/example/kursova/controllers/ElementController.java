package com.example.kursova.controllers;


import java.io.*;
import java.util.Collection;

import com.example.kursova.dao.ElementDao;
import com.example.kursova.model.Element;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "ElementController", value = {"/elements", "/index.jsp"})
public class ElementController extends HttpServlet {
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


        String command = req.getParameter("command");
        if(command == null){
            command = "showPages";
        }

        switch (command){
            case "edit":
                showEditForm(req, resp);
            case "showPages":
            default:
                showPages(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String command = req.getParameter("command");
        if(command == null){
            resp.sendError(400, "Щось пішло не так! Перегляньте коректність введених даних/ваших дій");
            return;
        }

        switch (command){
            case "delete":
                delete(req, resp);
                break;
            case "save":
                save(req, resp);
                break;
            case "create":
                create(req, resp);
                break;
            case "addToBasket":
                addToBasket(req, resp);
                break;
            default: resp.sendError(400, "Щось пішло не так! Перегляньте коректність введеної команди");

        }
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        try {
            Integer id = Integer.valueOf(req.getParameter("id"));
            elementDao.deleteById(id);
            resp.sendRedirect("admins/admin-page.jsp");
        } catch (Exception e){
            resp.sendError(400);
        }
    }

    private void save(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        try {
            Integer id = Integer.valueOf(req.getParameter("id"));
            String name = req.getParameter("name");
            String description = req.getParameter("description");
            Integer price = Integer.valueOf(req.getParameter("price"));
            String picture = req.getParameter("picture");

            Element element = new Element(id, name, description, price, picture);
            elementDao.update(element);
            resp.sendRedirect("admins/admin-page.jsp");

        } catch (Exception e){
            resp.sendError(400);
        }
    }

    private void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        try {
            String name = req.getParameter("name");
            String description = req.getParameter("description");
            Integer price = Integer.valueOf(req.getParameter("price"));
            String picture = req.getParameter("picture");

            Element element = new Element(name, description, price, picture);

            elementDao.create(element);
            resp.sendRedirect("admins/admin-page.jsp");
        } catch (Exception e){
            resp.sendError(400);
        }
    }

    private void showPages(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        Collection<Element> elements = elementDao.findAll();
        HttpSession session = req.getSession();
        session.setAttribute("elements", elements);
        req.getRequestDispatcher("jsp/title.jsp").forward(req, resp);
        req.getRequestDispatcher("admins/admin-page.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        try {
            Integer id = Integer.valueOf(req.getParameter("id"));
            Element element = elementDao.findById(id);
            req.setAttribute("element", element);
            req.getRequestDispatcher("functional/editElement.jsp").forward(req, resp);
        } catch (Exception e){
            resp.sendError(400);
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