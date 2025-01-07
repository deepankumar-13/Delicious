package com.Delicious.Servelets;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.Delicious.Controler.Cart;
import com.Delicious.Imp.MenuDAOImp;
import com.Delicious.Interface.MenuDAO;
import com.Delicious.Model.CartItem;
import com.Delicious.Model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	HttpSession session = req.getSession();
    	Cart cart = (Cart)session.getAttribute("cart");
    	if(cart==null) {
    		cart = new Cart();
    		session.setAttribute("cart", cart);
    	}
    	String action = req.getParameter("action");
    	String name = req.getParameter("name");
    	int itemId = Integer.parseInt(req.getParameter("itemId"));
    	session.setAttribute("menu_id",itemId);
    	MenuDAO menuDAO = null;
    	try {
    		menuDAO = new MenuDAOImp();
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	try {
    		if(action.equals("add")) {
    			Menu menuItem =menuDAO.fetchMenuByMenuID(itemId);
    			if(menuItem !=  null) {
    				int quantity = 1;
    				CartItem cartitem = new CartItem(menuItem.getMenuId(),
    						menuItem.getRestaurantId(),
    						menuItem.getName(),quantity,
    						menuItem.getPrice());
    				cart.addItem(cartitem);
    				session.setAttribute("cartitems",cartitem);
    			}
    		}
    		
    		else if(action.equals("update")) {
    		   int quantity = Integer.parseInt(req.getParameter("quantity"));
    		   cart.updateItem(itemId, quantity);
    		   session.setAttribute("quantity",quantity);
    		}

    		else if(action.equals("remove")) {
    			cart.remove(itemId);
    		}
    		else {
    			cart.clear();    		}
    		
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	session.setAttribute("cart", cart);
        req.getRequestDispatcher("/addtocart.jsp").forward(req, resp);
    }
}
