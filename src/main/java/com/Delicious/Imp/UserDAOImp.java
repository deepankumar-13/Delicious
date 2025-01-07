package com.Delicious.Imp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Delicious.DbConnection.MyDatabaseConnection;
import com.Delicious.Interface.UserDAO;
import com.Delicious.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserDAOImp implements UserDAO {
	private static final String INSERTUSER = "INSERT INTO USERS(USERNAME,PASSWORD,MOBILE,EMAIL,ADDRESS,USER_ID) VALUES (?, ?, ?, ?, ? ,?)";
	private static final String USERPASSWORDCHECK = "SELECT PASSWORD FROM USERS WHERE USERNAME= ?";
	private static final String USERID = "SELECT * FROM USERS WHERE USERNAME= ?";
	
	
	
	private static Connection con;
	private static PreparedStatement pstmt;
	private ResultSet resultSet;

		static {
			con = MyDatabaseConnection.connect();
		}

	@Override
	public int insert(User user) {
		try {
			pstmt=con.prepareStatement(INSERTUSER);
			pstmt.setString(1,user.getUsername());
			pstmt.setString(2,user.getPassword());
			pstmt.setString(3,user.getMobile());
			pstmt.setString(4,user.getEmail());
			pstmt.setString(5,user.getAddress());
			pstmt.setInt(6,user.getUserid());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public ResultSet fetchPassword(String username) {
		try {
			pstmt=con.prepareStatement(USERPASSWORDCHECK);
			pstmt.setString(1,username);
			resultSet = pstmt.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resultSet;
	}
	
	@Override
	public User fetchuserid(String username) {
		User user = null;
		try {
			pstmt=con.prepareStatement(USERID);
			pstmt.setString(1,username);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()) {
				user = new User();
				user.setUserid(resultSet.getInt("USER_ID"));
				user.setUsername(resultSet.getString("USERNAME"));
				user.setPassword(resultSet.getString("PASSWORD"));
				user.setAddress(resultSet.getString("ADDRESS"));
				user.setMobile(resultSet.getString("MOBILE"));
				user.setEmail(resultSet.getString("EMAIL"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

}
