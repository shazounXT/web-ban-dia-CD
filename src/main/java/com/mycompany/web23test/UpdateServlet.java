package com.mycompany.web23test;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String action = request.getParameter("action"); // "increase" hoặc "decrease"

        HttpSession session = request.getSession();
        Map<String, Item> cart = (Map<String, Item>) session.getAttribute("cart");

        if (cart != null && name != null && action != null) {
            Item item = cart.get(name);

            if (item != null) {
                if ("increase".equals(action)) {
                    item.quantity++;
                } else if ("decrease".equals(action)) {
                    item.quantity--;
                    if (item.quantity <= 0) {
                        cart.remove(name); // Tự động xóa nếu giảm còn 0
                    }
                }
            }
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
    }
}
