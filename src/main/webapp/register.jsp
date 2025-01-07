<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: url('img/register background.jpg') no-repeat center center fixed;
        background-size: cover;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        color: #fff;
    }

    form {
        background: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        padding: 20px 50px;
        border-radius: 15px;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.37);
        width: 550px;
    }

    h2 {
        margin-bottom: 15px;
        font-size: 2rem;
        font-weight: bold;
        text-align: center;
        text-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
    }

    label {
        font-size: 1rem;
        display: block;
        margin-bottom: 5px;
        text-align: left;
        color: #d9ffd9;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"],
    textarea {
        width: 100%;
        padding: 8px;
        margin-bottom: 12px;
        border: none;
        border-radius: 8px;
        background: rgba(255, 255, 255, 0.2);
        color: #fff;
        font-size: 1rem;
        outline: none;
        box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.2);
    }

    input[type="text"]::placeholder,
    input[type="password"]::placeholder,
    input[type="email"]::placeholder,
    textarea::placeholder {
        color: #c8facc;
    }

    input[type="submit"] {
        background: linear-gradient(to right, #32a852, #32e67e);
        color: #fff;
        border: none;
        padding: 10px;
        border-radius: 8px;
        font-size: 1rem;
        cursor: pointer;
        transition: 0.3s ease;
        width: 100%;
        font-weight: bold;
    }

    input[type="submit"]:hover {
        background: linear-gradient(to right, #32e67e, #32a852);
        transform: translateY(-2px);
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
    }

    a {
        color: #b3ffb3;
        text-decoration: none;
        font-weight: bold;
    }

    a:hover {
        text-decoration: underline;
        color: #fff;
    }

    .login-link {
        margin-top: 10px;
        text-align: center;
        font-size: 0.9rem;
    }
</style>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
    <form action="Register" method="post">
        <h2>Register</h2>
        <label for="username">User Name</label>
        <input type="text" id="username" name="username" placeholder="Enter your username" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required>

        <label for="confirmpassword">Confirm Password</label>
        <input type="password" id="confirmpassword" name="confirmpassword" placeholder="Confirm your password" required>

        <label for="mobile">Mobile</label>
        <input type="text" id="mobile" name="mobile" placeholder="Enter your mobile number" required>

        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="Enter your email" required>

        <label for="address">Address</label>
        <textarea id="address" name="address" rows="2" placeholder="Enter your address" required></textarea>

        <input type="submit" value="Register">

        <div class="login-link">If you have already registered, <a href="login.jsp">login here</a>.</div>
    </form>
</body>
</html>
