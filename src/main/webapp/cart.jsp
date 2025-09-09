<%@ page import="java.util.*" %>
<%@ page import="com.mycompany.web23test.Item" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your Cart</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<h2>Your cart</h2>
<%
    Map<String, Item> cart = (Map<String, Item>) session.getAttribute("cart");

    if (cart == null || cart.isEmpty()) {
%>
    <p>Your cart is empty.</p>
    <a href="index.html"><button>Continue Shopping</button></a>
<%
    } else {
%>
    <table>
        <tr>
            <th>Quantity</th>
            <th>Description</th>
            <th>Price</th>
            <th>Amount</th>
            <th></th>
        </tr>
<%
        for (Item item : cart.values()) {
%>
        <tr>
            <td>
                <form action="update" method="post" style="display:inline;">
                    <input type="hidden" name="name" value="<%= item.name %>">
                    <input type="hidden" name="action" value="decrease">
                    <button type="submit">-</button>
                </form>

                <span style="margin: 0 10px;"><%= item.quantity %></span>

                <form action="update" method="post" style="display:inline;">
                    <input type="hidden" name="name" value="<%= item.name %>">
                    <input type="hidden" name="action" value="increase">
                    <button type="submit">+</button>
                </form>
            </td>
            <td><%= item.name %></td>
            <td>$<%= String.format("%.2f", item.price) %></td>
            <td>$<%= String.format("%.2f", item.getAmount()) %></td>
            <td>
                <form action="remove" method="post">
                    <input type="hidden" name="name" value="<%= item.name %>">
                    <button type="submit">Remove Item</button>
                </form>
            </td>
        </tr>
<%
        }
%>
    </table>

    <p><strong>To change the quantity</strong>, use the + or - buttons.</p>
    <a href="index.html"><button>Continue Shopping</button></a>
    <a href="checkout.jsp"><button>Checkout</button></a>
<%
    }
%>
</body>
</html>