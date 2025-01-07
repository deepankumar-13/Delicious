<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Delicious</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #ff5722;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        .logo-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 50px;
            margin-right: 155px;
        }

        .logo {
            width: 400px;
            height: auto;
            animation: fadeIn 2s ease-in-out;
        }

        .logo-text {
            font-family: cursive;
            font-size: 4rem;
            color: white;
            margin-left: -135px;
            margin-bottom: 125px;
            animation: fadeInText 2s ease-in-out;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(-30px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInText {
            0% {
                opacity: 0;
                transform: translateY(-20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .container {
            margin-top: -225px;
            clear: both;
            animation: slideIn 1.5s ease-out;
        }

        @keyframes slideIn {
            0% {
                opacity: 0;
                transform: translateX(-50px);
            }
            100% {
                opacity: 1;
                transform: translateX(0);
            }
        }

        h1 {
            color: #fff;
            font-size: 3rem;
            margin: 20px 0;
            animation: fadeInText 2s ease-in-out;
        }

        .quote {
            color: white;
            font-size: 1.2rem;
            font-style: italic;
            margin-top: 20px;
            animation: fadeInText 2s ease-in-out;
        }

        .button-container {
            margin-top: 30px;
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .button {
            display: inline-block;
            padding: 10px 30px;
            margin: 10px;
            font-size: 1rem;
            font-weight: 600;
            color: orange;
            background-color: white;
            border: bold;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
        }

        .button:hover {
            background-color: #ff784e;
            transform: scale(1.05);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .button:active {
            background-color: #e64a19;
            transform: scale(1);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
    </style>
    <script>
	    function disp(id){
	        if(id === "1"){
	            alert("If you already Registered, Login here..!!\nOr else click signup to Register");
	        } else if(id === "2"){
	            alert("If you are a new user, Register here..!!\nOr else click signin..");
	        }
	    }
    </script>
</head>
<body>
    <div class="logo-container">
        <img src="img/delicious logo.png" alt="Delicious Logo" class="logo">
        <h2 class="logo-text">Delicious</h2>
    </div>

    <div class="container">
        <h1>Welcome to Delicious</h1>
        <p class="quote"><span style="color: yellow;">&#9733;</span> Savor the taste of joy, delivered right to your doorstep <span style="color: yellow;">&#9733;</span> ..!!</p>
        <div class="button-container">
            <a href="login.jsp" id="1" class="button" onclick="disp(this.id)">Sign In</a>
            <a href="register.jsp" id="2" class="button" onclick="disp(this.id)">Sign Up</a>
        </div>
    </div>
</body>
</html>
