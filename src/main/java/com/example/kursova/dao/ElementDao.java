package com.example.kursova.dao;

import com.example.kursova.model.Element;
import java.util.*;

public interface ElementDao {
    void create(Element element);

    Element findById(Integer id);

    Collection<Element> findAll();

    void update(Element riddle);

    void deleteById(Integer id);
}
