<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Delicious.Model.Order" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmed</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f9f4; 
            margin: 0;
            padding: 0;
            color: #333;
        }
        h1 {
            font-size: 2.5rem;
            color: #388e3c; 
            font-weight: 600;
            margin-bottom: 20px;
        }
        .container {
            max-width: 900px;
            margin: 50px auto;
            padding: 30px;
            background: #ffffff; 
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in-out;
            text-align: center;
            position: relative;
        }
        @keyframes fadeIn {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }
        .order-confirmation {
            margin-top: 30px;
            padding: 30px;
            background: #81c784; 
            border-radius: 12px;
            color: white;
            font-size: 1.3rem;
            font-weight: 500;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            transition: transform 0.4s ease-in-out, box-shadow 0.3s ease;
        }
        .order-confirmation:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        }
        .order-confirmation p {
            margin: 20px 0;
            font-weight: bold;
            font-size: 1.2rem;
        }
        .order-confirmation p strong {
            color: #ffffff;
            font-size: 1.4rem;
        }
        .check-mark {
            font-size: 1.5rem; 
            color: white; 
            background-color: #388e3c;  
            width: 50px;  
            height: 50px;  
            border-radius: 50%;  
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px auto;
            animation: checkMarkAnim 1s ease-in-out;
        }
        @keyframes checkMarkAnim {
            0% {
                transform: scale(0);
                opacity: 0;
            }
            50% {
                transform: scale(1.2);
                opacity: 1;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }
        .continue-shopping {
            display: inline-block;
            margin-top: 25px;
            padding: 15px 40px;
            background: #388e3c;  
            color: #ffffff;
            font-size: 1.4rem;
            font-weight: 500;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            text-decoration: none;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            transition: background-color 0.4s ease, transform 0.3s ease-in-out;
        }
        .continue-shopping:hover {
            background-color: #2c6c2f;  
            transform: translateY(-5px);
        }
        .continue-shopping:active {
            background-color: #1e4c1a;  
            transform: translateY(2px);
        }
        .confetti {
            position: absolute;
            top: -10px;
            left: 50%;
            width: 10px;
            height: 10px;
            background-color: #81c784;
            animation: confettiFall 3s ease-in-out infinite;
        }
        .confetti:nth-child(odd) {
            background-color: #388e3c;
        }
        @keyframes confettiFall {
            0% {
                transform: translateY(-100px);
                opacity: 1;
            }
            100% {
                transform: translateY(100vh);
                opacity: 0;
            }
        }
        .floating-btn {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 60px;
            height: 60px;
            background-color: #388e3c;  
            color: white;
            font-size: 2rem;
            border-radius: 50%;  
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease, transform 0.3s ease;
            cursor: pointer;
            text-decoration: none;
        }
        .floating-btn:hover {
            background-color: #2c6c2f;  
            transform: scale(1.1);  
        }
        .floating-btn:active {
            background-color: #1e4c1a;  
            transform: scale(1);  
        }
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
            h1 {
                font-size: 2rem;
            }
            .order-confirmation {
                font-size: 1.1rem;
                padding: 20px;
            }
            .continue-shopping {
                padding: 12px 30px;
                font-size: 1.1rem;
            }
            .floating-btn {
                width: 50px;
                height: 50px;
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Thank You for Your Order!</h1>
        <div class="check-mark">
            <i class="fas fa-check"></i>
        </div>
        <div class="order-confirmation">
            <p>Your order has been confirmed!</p>
            <p>We appreciate your business and we are preparing your meal.</p>
            <p><strong>Your estimated delivery time is 30-45 minutes.</strong></p>
            <p>If you wish to continue shopping, click the button below:</p>
            <a href="Home.jsp" class="continue-shopping">Continue Shopping</a>
        </div>
        <div class="confetti" style="left: 20%;"></div>
        <div class="confetti" style="left: 50%;"></div>
        <div class="confetti" style="left: 80%;"></div>
    </div>
    <a href="Home.jsp" class="floating-btn">🏠</a>
</body>
</html>
