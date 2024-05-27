package com.example.kursova.model;

import java.io.Serializable;
import java.util.List;

public class Order implements Serializable {
    private String name;
    private String city;
    private String address;
    private String house;
    private String flat;
    private String date;
    private String time;
    private String phone;
    private String email;
    private List<Element> basket;

    public Order(String name, String city, String address, String house, String flat, String date, String time, String phone, String email, List<Element> basket) {
        this.name = name;
        this.city = city;
        this.address = address;
        this.house = house;
        this.flat = flat;
        this.date = date;
        this.time = time;
        this.phone = phone;
        this.email = email;
        this.basket = basket;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getHouse() {
        return house;
    }

    public void setHouse(String house) {
        this.house = house;
    }

    public String getFlat() {
        return flat;
    }

    public void setFlat(String flat) {
        this.flat = flat;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<Element> getBasket() {
        return basket;
    }

    public void setBasket(List<Element> basket) {
        this.basket = basket;
    }
}