package com.Delicious.Servelets;

import java.io.IOException;
import java.util.List;
import com.Delicious.Imp.MenuDAOImp;
import com.Delicious.Model.Menu;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

 
@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("restaurant_id"));
	    MenuDAOImp menuDAO = new MenuDAOImp();
	    List<Menu> menuItems = menuDAO.fetchMenuByRestaurant(id);
	    HttpSession session = req.getSession();
	    session.setAttribute("restaurant_id",id);
	    session.setAttribute("menuItems", menuItems); 
	    req.getRequestDispatcher("/menu.jsp").forward(req, resp); 
    }
}
