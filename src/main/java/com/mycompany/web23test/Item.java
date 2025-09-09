package com.mycompany.web23test;

public class Item {
    public String name;
    public double price;
    public int quantity;

    public Item(String name, double price, int quantity) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }

    public double getAmount() {
        return price * quantity;
    }
}
