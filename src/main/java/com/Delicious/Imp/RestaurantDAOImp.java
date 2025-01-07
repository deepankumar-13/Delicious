package com.Delicious.Imp;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.Delicious.DbConnection.MyDatabaseConnection;
import com.Delicious.Interface.RestaurantDAO;
import com.Delicious.Model.Restaurant;

import jakarta.servlet.http.HttpServlet;

public class RestaurantDAOImp implements RestaurantDAO {
    
    private static Connection con;
    private static final String FETCHALLRESTAURANT = "SELECT * FROM RESTAURANT";

    static {
        con = MyDatabaseConnection.connect();
    }

    private Statement stmt;
    private ResultSet resultset;
    
    @Override
    public List<Restaurant> allrestaurant() {
        List<Restaurant> restaurants = new ArrayList<>();
        try {
            stmt = con.createStatement();
            resultset = stmt.executeQuery(FETCHALLRESTAURANT);

            while(resultset.next()) {
                restaurants.add(new Restaurant(
                        resultset.getInt("restaurant_id"),
                        resultset.getString("restaurant_name"),
                        resultset.getString("cusinetype"),
                        resultset.getString("delivarytime"),
                        resultset.getString("address"),
                        resultset.getFloat("ratings")));
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return restaurants;
    }
}
