package com.mycompany.web23test;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

   @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String name = request.getParameter("item");
    String priceStr = request.getParameter("price");

    response.setContentType("text/html;charset=UTF-8");

    if (name == null || priceStr == null || priceStr.isEmpty()) {
        response.getWriter().println("<h2 style='color:red;'>Lỗi: Tham số 'item' hoặc 'price' bị thiếu!</h2>");
        response.getWriter().println("<a href='index.html'>Quay lại trang sản phẩm</a>");
        return;
    }

    double price = Double.parseDouble(priceStr.trim());

    HttpSession session = request.getSession();
    Map<String, Item> cart = (Map<String, Item>) session.getAttribute("cart");

    if (cart == null) {
        cart = new LinkedHashMap<>();
    }

    if (cart.containsKey(name)) {
        cart.get(name).quantity += 1;
    } else {
        cart.put(name, new Item(name, price, 1));
    }

    session.setAttribute("cart", cart);
    response.sendRedirect("cart.jsp");
    }
}