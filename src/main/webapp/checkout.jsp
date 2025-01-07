<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckOut</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&family=Dancing+Script:wght@600&display=swap');

    body {
        font-family: 'Poppins', sans-serif;
        margin: 0;
        padding: 0;
        background: #FFA726; 
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    form {
        max-width: 400px;
        width: 100%;
        background: black; 
        border-radius: 16px;
        padding: 50px;
        padding-left: 30px;
        box-shadow: white;
        color: #333333; 
    }

    label {
        display: block;
        margin-bottom: 10px;
        color: orange;
        font-weight: 600;
        font-size: 14px;
    }

    input, textarea, select {
        width: 100%;
        padding: 12px;
        margin-bottom: 20px;
        border: 1px solid #ddd;
        border-radius: 8px;
        font-size: 14px;
        background: #f9f9f9;
        color: #333;
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    input:focus, textarea:focus, select:focus {
        border-color: #FFA726; 
        box-shadow: 0 0 8px rgba(255, 167, 38, 0.5);
        outline: none;
    }

    textarea {
        resize: none;
    }

    button {
        width: 100%;
        padding: 15px;
        border: none;
        border-radius: 8px;
        background: #FF5722; 
        color: #ffffff;
        font-weight: 600;
        font-size: 16px;
        cursor: pointer;
        box-shadow: 0 5px 15px rgba(255, 87, 34, 0.3);
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }

    button:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 20px rgba(255, 87, 34, 0.4);
    }

    button:active {
        transform: translateY(1px);
        box-shadow: 0 3px 10px rgba(255, 87, 34, 0.2);
    }

    select {
        cursor: pointer;
    }

    input::placeholder, textarea::placeholder {
        color: #aaa;
        font-style: italic;
    }

    .header {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
        position: relative;
    }

    .logo {
        width: 80px; 
        height: auto;
        position: absolute;
        left: 0;
    }

    .app-name {
        font-size: 24px;
        font-family: 'Dancing Script', cursive;
        font-weight: 600;
        color: orange;
        margin-left: 60px;
        margin-bottom:20px
    }

    @media (max-width: 768px) {
        form {
            padding: 20px;
        }
        button {
            font-size: 14px;
            padding: 12px;
        }
        .app-name {
            font-size: 20px;
        }
    }
</style>
</head>
<body>
    <form action="checkout" method="post">
        <div class="header">
            <img src="img/delicious logo.png" alt="Logo" class="logo">
            <div class="app-name">Delicious</div>
        </div>

        <label for="address">Address</label>
        <textarea id="address" name="address" rows="2" placeholder="Enter your address" required></textarea>

        <label for="state">State</label>
        <input type="text" id="state" name="state" placeholder="Enter your state" required>

        <label for="city">City</label>
        <input type="text" id="city" name="city" placeholder="Enter your city" required>

        <label for="pincode">Pincode</label>
        <input type="text" id="pincode" name="pincode" placeholder="Enter your pincode" required pattern="\d{6}" title="Enter a valid 6-digit pincode">

        <label for="payment">Payment Method</label>
        <select id="payment" name="payment">
            <option value="Cash On Delivery">Cash On Delivery</option>
            <option value="UPI">UPI</option>
            <option value="Card-payment">Card Payment</option>
        </select>
        
        <button type="submit" class="place-order-btn">Place Order</button>
    </form>
</body>
</html>
