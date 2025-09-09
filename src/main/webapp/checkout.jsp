<%@ page import="java.util.*, com.mycompany.web23test.Item" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Checkout</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<h2>Checkout Summary</h2>

<%
    Map<String, Item> cart = (Map<String, Item>) session.getAttribute("cart");
    double total = 0.0;

    if (cart == null || cart.isEmpty()) {
%>
    <p>Your cart is empty. <a href="index.html">Back to shopping</a></p>
<%
    } else {
%>
    <table>
        <tr>
            <th>Description</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Amount</th>
        </tr>
<%
        for (Item item : cart.values()) {
            double amount = item.getAmount();
            total += amount;
%>
        <tr>
            <td><%= item.name %></td>
            <td>$<%= String.format("%.2f", item.price) %></td>
            <td><%= item.quantity %></td>
            <td>$<%= String.format("%.2f", amount) %></td>
        </tr>
<%
        }
%>
        <tr>
            <td colspan="3" style="text-align:right;"><strong>Total:</strong></td>
            <td><strong>$<%= String.format("%.2f", total) %></strong></td>
        </tr>
    </table>

    <h3 style="color: green;">✅ Thank you for your purchase!</h3>

    <%
        // Xoá giỏ hàng sau khi thanh toán
        session.removeAttribute("cart");
    %>

    <a href="index.html"><button>Back to Home</button></a>
<%
    }
%>

</body>
</html>
