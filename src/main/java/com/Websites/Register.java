package com.Websites;

import java.io.IOException;
import com.Delicious.Imp.UserDAOImp;
import com.Delicious.Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Register extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    HttpSession session = req.getSession();
	    String password = MySecurity.encrypt(req.getParameter("password"));
	    String cPassword = MySecurity.encrypt(req.getParameter("confirmpassword"));

	    if (password.equals(cPassword)) {
	        String username = MySecurity.encrypt(req.getParameter("username"));
	        String email = MySecurity.encrypt(req.getParameter("email"));
	        String address = MySecurity.encrypt(req.getParameter("address"));
	        String mobile = MySecurity.encrypt(req.getParameter("mobile"));

	        User user = new User();
	        user.setUsername(username);
	        user.setEmail(email);
	        user.setAddress(address);
	        user.setMobile(mobile);
	        user.setPassword(password);

	        session.setAttribute("loggedInUser",user);
	        System.out.println(user);
	        UserDAOImp usdao = new UserDAOImp();
	        
	        int res = usdao.insert(user);
	        if (res != 0) {
	            resp.sendRedirect("login.jsp");
	        } else {
	            resp.sendRedirect("failed.html");
	        }
	    } else {
	        resp.sendRedirect("register.jsp");
	    }
	}
}
