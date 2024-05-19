package com.example.kursova.util;

import com.example.kursova.dao.ElementDao;
import com.example.kursova.model.Element;

public class ElementCreator {
    public static void createElementCreator(ElementDao elementDao){
        elementDao.create(new Element("ТЕСТ", "СВЄТА СПЕК", 100, "D:/nakedHelpers/nakedFloWer1k"));
        elementDao.create(new Element("ТЕСТ", "СВЄТА СПЕК", 100, "D:/nakedHelpers/nakedFloWer1k"));
        elementDao.create(new Element("ТЕСТ", "СВЄТА СПЕК", 1000, "D:/nakedHelpers/nakedFloWer1k"));
        elementDao.create(new Element("ТЕСТ", "СВЄТА СПЕК", 100, "D:/nakedHelpers/nakedFloWer1k"));
        elementDao.create(new Element("1", "1", 1, "1"));
        elementDao.create(new Element("1", "1", 1, "1"));
        elementDao.create(new Element("1", "1", 1, "1"));
    }
}
