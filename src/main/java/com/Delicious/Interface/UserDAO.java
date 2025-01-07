package com.Delicious.Interface;

import java.sql.ResultSet;

import com.Delicious.Model.User;

public interface UserDAO {
	int insert(User user);
	ResultSet fetchPassword(String username);
	User fetchuserid(String username);
}
