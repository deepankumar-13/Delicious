package com.Delicious.Controler;

import java.io.IOException;
import java.util.List;

import com.Delicious.Imp.RestaurantDAOImp;
import com.Delicious.Model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class GetProducts extends HttpServlet {

    private List<Restaurant> restaurants;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        
        if (session != null && session.getAttribute("userName") != null) {
            try {
                RestaurantDAOImp restaurantDao = new RestaurantDAOImp();
                restaurants = restaurantDao.allrestaurant();
                session.setAttribute("restaurants", restaurants);

                resp.sendRedirect("Home.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                resp.sendRedirect("error.jsp");
            }
        } else {
            resp.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
        doGet(req, resp);
    }
}
