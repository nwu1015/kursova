package com.example.kursova.util;

import com.example.kursova.dao.ElementDao;
import com.example.kursova.model.Element;

public class ElementCreator {
    public static void createElementCreator(ElementDao elementDao){
        elementDao.create(new Element("Філаделфія Голдфіш", "282г | 8шт. Лосось, сир, лимон, вугор, авокадо", 335, "/images/filadelfia-goldfish.png"));
        elementDao.create(new Element("Філадельфія Grill", "282г | 8шт. Лосось, огірок, сир, соус соєвий", 275, "/images/filadelfia-grill.png"));
        elementDao.create(new Element("Каліфорнія з тунцем", "222г | 8шт. Тунець, вугор, авокадо, лосось, кунжут", 279, "/images/california-with-tuna.png"));
        elementDao.create(new Element("Каліфорнія у вугрі", "274г | 8шт. Тунець, ікра тобіко, авокадо", 359, "/images/california-in-black.png"));
        elementDao.create(new Element("Yakuza (авт.)", "327г | 7шт. Лосось, вугор, краб, огірок, соус унагі", 449, "/images/yakuza.png"));
        elementDao.create(new Element("Туна (авт.)", "304г | 7шт. Тунець, лосось, креветка, ікра, авокадо", 409, "/images/tuna.png"));
        elementDao.create(new Element("Каліфорнія мікс", "222г | 8шт. Тунець, авокадо, лосось, ікра тобіко", 329, "/images/california-mix.png"));
    }
}
