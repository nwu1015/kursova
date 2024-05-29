package com.example.kursova.dao;

import com.example.kursova.model.Element;
import java.util.*;

public class InMemoryElementDao implements ElementDao{

    private TreeMap<Integer, Element> elements = new TreeMap<>();

    @Override
    public void create(Element element) {
        int id = elements.isEmpty() ? 1 : elements.lastKey() + 1;
        element.setId(id);
        elements.put(id, element);
    }

    @Override
    public Element findById(Integer id) {
        return elements.get(id);
    }

    @Override
    public Collection<Element> findAll() {
        return elements.values();
    }

    @Override
    public void update(Element element) {
        elements.put(element.getId(), element);
    }

    @Override
    public void deleteById(Integer id) {
        elements.remove(id);
    }
}
