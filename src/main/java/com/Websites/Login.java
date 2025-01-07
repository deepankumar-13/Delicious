package com.Websites;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.net.URLDecoder;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Delicious.Imp.UserDAOImp;
import com.Delicious.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Login extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = MySecurity.encrypt(req.getParameter("username"));
        String password = req.getParameter("password");
        UserDAOImp uspwd = new UserDAOImp();
        
        HttpSession session = req.getSession();
        
        
        ResultSet checkpassword = uspwd.fetchPassword(userName);
        User userid = uspwd.fetchuserid(userName);
        
        try {
            if (checkpassword.next() && MySecurity.decrypt(checkpassword.getString(1)).equals(password)) {
                Cookie ck = new Cookie("userName", URLEncoder.encode(userName, "UTF-8"));
                resp.addCookie(ck);
                
                session.setAttribute("userName", MySecurity.decrypt(userName));
                session.setAttribute("password", MySecurity.decrypt(password));
                
                session.setAttribute("loggedInUser", userid);
                req.getRequestDispatcher("GetProducts").forward(req, resp);
            } else {
                resp.sendRedirect("login.jsp");
            }
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
        
    }
}
