package com.Delicious.Servelets;

import java.io.IOException;
import java.util.List;

import com.Delicious.Controler.Cart;
import com.Delicious.Imp.OrderDAOImp;
import com.Delicious.Imp.Order_itemsDAOImp;
import com.Delicious.Model.CartItem;
import com.Delicious.Model.Order;
import com.Delicious.Model.Order_items;
import com.Delicious.Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckOutServlet extends HttpServlet {
    
    private OrderDAOImp orderImp;
    private Order_itemsDAOImp order_itemsImp;
    
    @Override
    public void init() {
        try {
            orderImp = new OrderDAOImp();
            order_itemsImp = new Order_itemsDAOImp();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String address = req.getParameter("address");
        String state = req.getParameter("state");
        String city = req.getParameter("city");
        String pincode = req.getParameter("pincode");
        String payment = req.getParameter("payment");

        Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) session.getAttribute("loggedInUser");

       
        if (cart == null || user == null || cart.getItems().isEmpty()) {
            resp.sendRedirect("checkout.jsp");
            return;
        }

        try {
            // Create and insert Order
            Order order = new Order();
            Integer restaurantId = (Integer) session.getAttribute("restaurant_id");
            if (restaurantId == null) {
                throw new IllegalStateException("Restaurant ID not found in session");
            }
            System.out.println(user.getUserid());
            order.setUserId(user.getUserid());
            order.setRestaurantId(restaurantId);
            order.setPaymentMode(payment);
            order.setStatus("pending");

            float totalAmount = 0;
            for (CartItem item : cart.getItems().values()) {
                totalAmount += item.getPrice() * item.getQuantity();
            }
            order.setTotalAmount(totalAmount);

            int rowsAffected = orderImp.insertOrder(order);

            if (rowsAffected > 0) {
                session.removeAttribute("cart");
                session.setAttribute("order", order);
                session.setAttribute("address",address);
                session.setAttribute("state",state);
                session.setAttribute("city",city);
                session.setAttribute("pincode",pincode);
                session.setAttribute("totalAmount", totalAmount);
                session.setAttribute("paymentMode", payment);
                session.setAttribute("status", "pending");
                session.setAttribute("cartItems", cart.getItems().values());
                
                List<Order> orderlist = orderImp.getOrders(user.getUserid());
                int highest = Integer.MIN_VALUE;
                for(Order orders : orderlist) {
                	int orderId = orders.getOrder_id();
                	if(highest < orderId) {
                		highest = orderId;
                	}
                }
                System.out.println(highest);
                session.setAttribute("highest",highest);
                for (CartItem item : cart.getItems().values()) {
                    Order_items orderItem = new Order_items();
                    orderItem.setOrder_id(highest);
                    orderItem.setMenu_id(item.getItemId());
                    System.out.println(item.getItemId());
                    orderItem.setQuantity(item.getQuantity());
                    orderItem.setItems_total(item.getPrice() * item.getQuantity());

                    int itemRowsAffected = order_itemsImp.insertOrderItems(orderItem);
                    if (itemRowsAffected <= 0) {
                        throw new RuntimeException("Failed to insert order item for menu ID: " + item.getItemId());
                    }
                }
                
                List<Order_items> orderedItems = order_itemsImp.fetchAllOrders(highest);
                session.setAttribute("orderedItems", orderedItems);

                resp.sendRedirect("orderconfirmation.jsp");
            } else {
                resp.sendRedirect("checkout.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }
    }
}
