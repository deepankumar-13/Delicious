<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.Delicious.*" %>
<%@ page import="java.util.List, com.Delicious.Model.Restaurant" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/x-icon" href="img/delicious logo.png" sizes="256x256">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delicious</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background : transprant;
        }

        /* Body Styling */
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f9f9f9;
            color: #333;
            line-height: 1.6;
        }

        .applogo {
            width: 180px;
            height: auto;
            margin-right: 20px;
            margin-top: 40px;
            margin-left: -60px;
        }

        /* Header Section */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #ff5722;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 5px 15px;
            height: 70px;
            width: 100%;
        }

        .logo-container {
            display: flex;
            align-items: center;
        }

        .logo {
            font-size: 2.5em;
            font-family: 'Pacifico', cursive;
            color: white;
            margin-left: -80px;
        }

        .navbar {
            display: flex;
            gap: 20px;
            position: relative;
            margin-right: 100px;
        }

        .navbar a {
            color: white;
            margin-left: 20px;
            text-decoration: none;
            font-size: 1.1em;
            font-weight: 500;
            position: relative;
        }

        /* Navbar Dropdown */
        .navbar .dropdown {
            position: relative;
        }

        .navbar .dropdown-content {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            overflow: hidden;
            min-width: 150px;
        }

        .navbar .dropdown-content a {
            display: block;
            color: #333;
            padding: 10px 20px;
            text-decoration: none;
        }

        .navbar .dropdown-content a:hover {
            background: #f1f1f1;
        }

        .navbar .dropdown:hover .dropdown-content {
            display: block;
        }

        /* Banner Section */
        .banner {
            position: relative;
            width: 100%;
            height: 400px;
        }

        .banner img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .banner h1 {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 3.3em;
            font-weight: bold;
            color: white;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        .welcome-message {
            font-size: 2.5em;
            font-weight: bold;
            color: #ff5722;
            margin: 30px 0;
        }

        /* Card Layout for Restaurants */
        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
            margin-top: 30px;
        }

        .card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 500px;
            transition: transform 0.3s ease, box-shadow 0.3s ease, background 0.3s ease;
            position: relative;
            border: 1px solid #ddd;
            background: #fff;
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.15); /* Reduced shadow */
            background: #f1f1f1; /* Slightly lighter background on hover */
        }

        .card .restaurant-image {
            width: 100%;
            height: 250px;
            object-fit: cover;
            transition: opacity 0.5s ease;
        }

        .card:hover .restaurant-image {
            opacity: 0.7;
        }

        .card-header {
            font-size: 1.8em;
            font-weight: bold;
            text-align: center;
            padding: 10px;
            background: linear-gradient(90deg, #ff8c00, #ffd700);
            color: white;
            /* Removed the text-shadow property to prevent the glowing effect */
            transition: background-color 0.3s ease;
        }

        .card-header:hover {
            background: #e64a19;
        }

        .card-body {
            padding: 15px;
            flex-grow: 1;
        }

        .card-body p {
            font-size: 1em;
            color: #555;
        }

        /* Card Footer */
        .card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            background: #f9f9f9;
            margin-top: auto;
        }

        .ratings-badge {
            background-color: #4caf50;
            color: white;
            padding: 8px 15px;
            border-radius: 30px;
            font-size: 1.2em;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s ease;
        }

        .ratings-badge:hover {
            transform: scale(1.1);
        }

        .card-button {
            background: linear-gradient(90deg, #ff5722, #e64a19);
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 30px;
            font-size: 1.2em;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-button:hover {
            background: linear-gradient(90deg, #e64a19, #ff5722);
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Roboto:wght@400;500&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Header Section -->
    <div class="header">
        <div class="logo-container">
            <img src="img/delicious logo.png" class="applogo" alt="logo-image">
            <div class="logo">Delicious</div>
        </div>
        <div class="navbar">
            <a href="#">Home</a>
            <div class="dropdown">
                <a href="#">Cuisine Types</a>
                <div class="dropdown-content">
                    <a href="#">Indian</a>
                    <a href="#">Chinese</a>
                    <a href="#">Italian</a>
                </div>
            </div>
            <a href="#">Restaurant List</a>
            <a href="#">Profile</a>
        </div>
    </div>

    <!-- Banner Section with Welcome Message -->
    <div class="banner">
        <img src="img/food banner.jpeg" alt="Food Banner Image">
        <h1>Welcome to Delicious, <% out.println(session.getAttribute("userName")); %>!</h1>
    </div>

    <% 
        List<Restaurant> restaurants = (List<Restaurant>) session.getAttribute("restaurants");
    %>
    
    <!-- Card Layout for Restaurants -->
    <div class="card-container">
        <% 
            for (Restaurant r : restaurants) {
        %>
        <div class="card">
            <img src="img/<%= r.getRestaurant_name() + ".jpg" %>" alt="<%= r.getRestaurant_name() %>" class="restaurant-image">

            <div class="card-header">
                <%= r.getRestaurant_name() %>
            </div>
            <div class="card-body">
                <p><strong>Cuisine Type:</strong> <%= r.getCusinetype() %></p>
                <p><strong>Delivery Time:</strong> <%= r.getDelivarytime() %></p>
                <p><strong>Address:</strong> <%= r.getAddress() %></p>
            </div>
            <div class="card-footer">
                <span class="ratings-badge">Ratings: <%= r.getRatings() %></span>
                <form action="MenuServlet" method="get">
                    <input type="hidden" name="restaurant_id" value="<%= r.getRestaurant_id() %>">
                    <button type="submit" class="card-button">View Menu</button>
                </form>
            </div>
        </div>
        <% 
            }
        %>
    </div>

</body>
</html>
