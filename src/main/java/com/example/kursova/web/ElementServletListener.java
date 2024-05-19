package com.example.kursova.web;

import com.example.kursova.dao.InMemoryElementDao;
import com.example.kursova.dao.ElementDao;
import com.example.kursova.util.ElementCreator;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class ElementServletListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ElementDao elementDao = new InMemoryElementDao();
        ElementCreator.createElementCreator(elementDao);
        sce.getServletContext().setAttribute("elementDao", elementDao);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}