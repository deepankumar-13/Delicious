<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.Delicious.Model.Menu" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
    <style>
        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: url('img/Food background.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            text-align: center;
            font-size: 2.5em;
            color: #ff5722;
            margin-bottom: 30px;
        }

        .menu-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            width: 100%;
            max-width: 1200px;
        }

        .menu-item {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15), 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            flex-direction: column;
            position: relative;
        }

        .menu-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.25), 0 0 15px rgba(0, 0, 0, 0.15);
        }

        .menu-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            display: block;
        }

        .menu-item-content {
            padding: 15px;
            background-color: #fff;
            z-index: 1;
            position: relative;
        }

        .menu-item h3 {
            color: #ff5722;
            font-size: 1.8em;
            margin-bottom: 10px;
        }

        .menu-item p {
            margin: 10px 0;
            color: #555;
            font-size: 1em;
        }

        .menu-item p strong {
            color: #333;
        }

        .availability-badge {
            display: inline-block;
            padding: 5px 10px;
            font-size: 0.9em;
            font-weight: bold;
            color: white;
            border-radius: 5px;
        }

        .available {
            background-color: #4caf50;
        }

        .not-available {
            background-color: #f44336;
        }

        .add-to-cart-btn {
            margin-top: 15px;
            padding: 12px 25px;
            background-color: #ff5722;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 1.1em;
            cursor: pointer;
            text-align: center;
            font-weight: bold;
            transition: background-color 0.3s, transform 0.2s;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .add-to-cart-btn:hover {
            background-color: #e64a19;
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
        }

        .add-to-cart-btn:active {
            transform: translateY(0);
            box-shadow: 0 3px 7px rgba(0, 0, 0, 0.2);
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

</head>
<body>
    <h1>Menu Items</h1>

    <% 
        List<Menu> menuItems = (List<Menu>) session.getAttribute("menuItems");
        if (menuItems == null || menuItems.isEmpty()) {
    %>
        <p>No menu items available for this restaurant.</p>
    <% 
        } else {
    %>
        <div class="menu-container">
            <% for (Menu m : menuItems) { %>
                <div class="menu-item">
                    <img src="img/<%=m.getName()+".jpg" %>" alt="<%= m.getName() %>">
                    <div class="menu-item-content">
                        <h3><%= m.getName() %></h3>
                        <p><strong>Description:</strong> <%= m.getDescription() %></p>
                        <p><strong>Price:</strong> &#8377;<%= m.getPrice() %></p>
                        <span class="availability-badge <%= m.isAvailable() ? "available" : "not-available" %>">
                            <%= m.isAvailable() ? "Available" : "Not Available" %>
                        </span>
                        <form action="CartServlet" method="get">
                        	<input type ="hidden" name ="itemId" value = "<%=m.getMenuId() %>">
                        	<input type ="hidden" name ="quantity" value = 1>
                        	<input type ="hidden" name ="action" value="add">
                        	<button type="submit" class="add-to-cart-btn" >Add to Cart</button>
                        </form>
						

                    </div>
                </div>
            <% } %>
        </div>
    <% 
        }
    %>

</body>
</html>
