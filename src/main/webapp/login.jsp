<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: url('img/login background.jpg') no-repeat center center fixed;
        margin-left: -800px;
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
        padding: 30px 40px;
        border-radius: 15px;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.37);
        width: 350px;
        text-align: center;
    }

    h2 {
        margin-bottom: 20px;
        font-size: 1.8rem;
        font-weight: bold;
        text-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
    }

    label {
        font-size: 1rem;
        display: block;
        margin-bottom: 10px;
        text-align: left;
        color: #e0e0e0;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 12px;
        margin-bottom: 20px;
        border: none;
        border-radius: 10px;
        background: rgba(255, 255, 255, 0.2);
        color: #fff;
        font-size: 1rem;
        outline: none;
        box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.2);
    }

    input[type="text"]::placeholder,
    input[type="password"]::placeholder {
        color: #d1d1d1;
    }

    input[type="submit"] {
        background: linear-gradient(to right, #6a11cb, #2575fc);
        color: #fff;
        border: none;
        padding: 12px 20px;
        border-radius: 10px;
        font-size: 1rem;
        cursor: pointer;
        transition: 0.3s ease;
        width: 100%;
        font-weight: bold;
    }

    input[type="submit"]:hover {
        background: linear-gradient(to right, #2575fc, #6a11cb);
        transform: translateY(-3px);
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
    }

    a {
        color: #ffcccb;
        text-decoration: none;
        font-weight: bold;
    }

    a:hover {
        text-decoration: underline;
        color: #fff;
    }

    .register-link {
        margin-top: 15px;
        display: block;
        font-size: 0.9rem;
    }
</style>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
    <form action="login" method="post">
        <h2>Login Here</h2>
        <label for="username">User Name</label>
        <input type="text" id="username" name="username" placeholder="Enter your username" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required>

        <input type="submit" value="Login">

        <span class="register-link">If you don't have an account, <a href="register.jsp">register here</a>.</span>
    </form>
</body>
</html>
