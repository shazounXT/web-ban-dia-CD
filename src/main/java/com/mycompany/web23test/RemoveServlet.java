package com.mycompany.web23test;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet("/remove")
public class RemoveServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");

        if (name != null) {
            HttpSession session = request.getSession();
            Map<String, Item> cart = (Map<String, Item>) session.getAttribute("cart");

            if (cart != null) {
                cart.remove(name);
                session.setAttribute("cart", cart);
            }
        }

        response.sendRedirect("cart.jsp");
    }
}
