<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Collection" %>
<%@ page import="com.Delicious.Model.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .container {
            max-width: 900px;
            margin: 40px auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #1a73e8;
        }
        .order-details {
            margin-top: 20px;
            font-size: 1rem;
            padding: 15px;
            background: #e0f7fa;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            color: #00695c;
        }
        .order-details p {
            margin: 5px 0;
            font-weight: bold;
        }
        .order-details p strong {
            color: #004d40;
        }
        .items-section {
            margin-top: 30px;
        }
        .items-row {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .item-card {
            display: flex;
            background: #f9f9fb;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            align-items: center;
            padding: 10px;
        }
        .item-card img {
            flex-shrink: 0;
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 8px;
            margin-right: 15px;
        }
        .item-details {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }
        .item-details h3 {
            font-size: 1.2rem;
            margin: 0;
            color: #1a73e8;
            font-weight: bold;
        }
        .item-details p {
            margin: 0;
            font-size: 1rem;
            font-weight: bold;
            color: #555;
        }
        .summary {
            margin-top: 20px;
            padding: 15px;
            background: #e3f2fd;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: bold;
            color: #333;
            text-align: center;
        }
        .place-order-btn {
            display: block;
            margin: 30px auto;
            padding: 10px 20px;
            background: #1a73e8;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            text-align: center;
        }
        .place-order-btn:hover {
            background: #135ab7;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Order Confirmation</h1>

        <% 
            Order order = (Order) session.getAttribute("order");
            Collection<CartItem> items = (Collection<CartItem>) session.getAttribute("cartItems");
            Float totalAmount = (Float) session.getAttribute("totalAmount");
            String paymentMode = (String) session.getAttribute("paymentMode");
            String status = (String) session.getAttribute("status");
            Integer highest = (Integer) session.getAttribute("highest");
            String address = (String) session.getAttribute("address");
            String state = (String) session.getAttribute("state");
            String city = (String) session.getAttribute("city");
            String pincode = (String) session.getAttribute("pincode");

            if (order == null || items == null || totalAmount == null || paymentMode == null || status == null || highest == null) {
        %>
            <p>Something went wrong. Please try again later.</p>
        <% } else { %>

            <div class="order-details">
                <p><strong>Order ID:</strong> <%= highest %></p>
                <p><strong>Address:</strong> <%= address %></p>
                <p><strong>State:</strong> <%= state %></p>
                <p><strong>City:</strong> <%= city %></p>
                <p><strong>Pincode:</strong> <%= pincode %></p>
                <p><strong>Payment Method:</strong> <%= paymentMode %></p>
                <p><strong>Status:</strong> <%= status %></p>
                <p><strong>Total Amount:</strong> &#8377;<%= totalAmount %></p>
            </div>

            <div class="items-section">
                <h2>Ordered Items</h2>
                <div class="items-row">
                    <% for (CartItem item : items) { %>
                        <div class="item-card">
                            <img src="img/<%= item.getName()%>.jpg" alt="<%= item.getName() %>">
                            <div class="item-details">
                                <h3><%= item.getName() %></h3>
                                <p>Quantity: <%= item.getQuantity() %></p>
                                <p>Price: &#8377;<%= item.getPrice() %></p>
                                <p>Total: &#8377;<%= item.getPrice() * item.getQuantity() %></p>
                            </div>
                        </div>
                    <% } %>
                </div>
            </div>

            <div class="summary">
                Total Amount: &#8377;<%= totalAmount %>
            </div>

            <form action="confirm.jsp">
                <button type="submit" class="place-order-btn">Confirm Order</button>
            </form>

        <% } %>
    </div>
</body>
</html>
