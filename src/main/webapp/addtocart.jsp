<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Delicious.Controler.*" %>
<%@ page import="com.Delicious.Model.CartItem" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #ff6347;
            color: white;
            text-align: center;
            padding: 20px;
        }

        h1 {
            margin: 0;
        }

        .cart-container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .cart-items {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .cart-item-card {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 15px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            overflow: hidden;
        }

        .cart-item-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .cart-item-card img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 8px;
            margin-right: 20px;
        }

        .cart-item-details {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .cart-item-details h3 {
            margin: 0;
            font-size: 20px;
            color: #333;
        }

        .cart-item-details p {
            margin: 0;
            color: #555;
        }

        .quantity-control {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .quantity-control button {
            background-color: #ff6347;
            color: white;
            border: none;
            padding: 5px 15px;
            border-radius: 2px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .quantity-control button:hover {
            background-color: #e5533c;
        }

        .quantity-control span {
            display: inline-block;
            width: 40px;
            text-align: center;
            font-size: 16px;
            font-weight: thick;
            font-family: cursive;
        }

        .total-amount{
            font-size:20px;
            font-weight:bold;
            margin-left:985px;
            margin-top:20px
        }

        .remove-item-form {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .remove-item-btn {
            background-color: #ff6347;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-left:20px;
            font-weight:bolder;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .remove-item-btn:hover {
            background-color: #e5533c;
            transform: scale(1.05);
        }

        .buttons-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }

        .add-more-items-link {
            background-color: #000;
            color: white;
            padding: 8px 16px;
            text-align: center;
            display: inline-block;
            font-size: 14px;
            font-weight: bold;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
            margin-left: 880px;
        }

        .proceed-to-checkout-btn {
            font-size: 14px;
            color: #fff;
            font-weight: bold;
            background-color: #28a745;
            padding: 6px 12px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
            text-align: center;
            text-decoration: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .add-more-items-link:hover {
            background-color: #333;
            transform: scale(1.05);
        }

        .proceed-to-checkout-btn:hover {
            background-color: #218838;
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .proceed-to-checkout-btn:focus {
            outline: none;
            box-shadow: 0 0 5px 3px rgba(0, 255, 0, 0.4);
        }

        footer {
            text-align: center;
            margin-top: 40px;
        }

        footer a {
            color: #ff6347;
            text-decoration: none;
            font-size: 18px;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <h1>Shopping Cart</h1>
    </header>

    <div class="cart-container">
        <h2>Your Cart</h2>

        <% 
            Cart cart = (Cart) session.getAttribute("cart");
            double totalAmount = 0.0;
            if (cart != null && cart.getItems().size() > 0) {
        %>
            <div class="cart-items">
                <% for (CartItem cartItem : cart.getItems().values()) { 
                    double itemTotal = cartItem.getPrice() * cartItem.getQuantity();
                    totalAmount += itemTotal;
                %>
                    <div class="cart-item-card">
                    <img src="img/<%= cartItem.getName() + ".jpg" %>" alt="<%= cartItem.getName() %>">
                        <div class="cart-item-details">
                            <h3><%= cartItem.getName() %></h3>
                            <p>Price: ₹<%= cartItem.getPrice() %></p>
                        </div>
                        <div class="quantity-control">
                            <form action="CartServlet" method="get">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="itemId" value="<%= cartItem.getItemId() %>">
                                <button type="submit" name="quantity" value=<%=cartItem.getQuantity()-1%>>-</button>
                                <span><%= cartItem.getQuantity() %></span>
                                <button type="submit" name="quantity" value=<%=cartItem.getQuantity()+1%>>+</button>
                            </form>
                        </div>

                        <form action="CartServlet" method="get" class="remove-item-form">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="itemId" value="<%= cartItem.getItemId() %>">
                            <button type="submit" class="remove-item-btn">Remove</button>
                        </form>
                    </div>
                <% } %>
            </div>

            <div class="total-amount">
                Total Amount: ₹<%= totalAmount %>
            </div>

        <% 
            } else { 
        %>
            <p>Your cart is empty. Start adding items!</p>
        <% 
            } 
        %>

        <div class="buttons-container">
            <a href="menu.jsp" class="add-more-items-link">Add More Items</a>
            <form action="checkout.jsp" method="get">
                <button type="submit" class="proceed-to-checkout-btn">Proceed to Checkout</button>
            </form>
        </div>

    </div>

    <footer>
        <a href="Home.jsp">Back to Restaurants</a>
    </footer>
</body>
</html>
