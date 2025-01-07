package com.Delicious.Imp;

import java.sql.*;
import com.Delicious.DbConnection.MyDatabaseConnection;
import com.Delicious.Interface.MenuDAO;
import com.Delicious.Model.Menu;
import java.util.ArrayList;
import java.util.List;

public class MenuDAOImp implements MenuDAO {

    private static final String FETCHMENU = "SELECT * FROM MENU WHERE RESTAURANT_ID= ?";
    private static final String FETCHMENUBYID = "SELECT * FROM MENU WHERE MENU_ID = ?";
    private static Connection con;

    static {
        con = MyDatabaseConnection.connect();
    }

    @Override
    public List<Menu> fetchMenuByRestaurant(int restaurant_id) {
        List<Menu> menulist = new ArrayList<>();
        try (PreparedStatement pstmt = con.prepareStatement(FETCHMENU)) {
            pstmt.setInt(1, restaurant_id);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    menulist.add(new Menu(
                            resultSet.getInt("menu_id"),
                            resultSet.getInt("restaurant_id"),
                            resultSet.getString("name"),
                            resultSet.getString("description"),
                            resultSet.getInt("price"),
                            resultSet.getBoolean("is_available"),
                            resultSet.getString("image_path")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menulist;
    }

    @Override
    public Menu fetchMenuByMenuID(int itemId) {
        Menu menu = null;
        try (PreparedStatement pstmt = con.prepareStatement(FETCHMENUBYID)) {
            pstmt.setInt(1, itemId);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                if (resultSet.next()) {
                    menu = new Menu(
                            resultSet.getInt("menu_id"),
                            resultSet.getInt("restaurant_id"),
                            resultSet.getString("name"),
                            resultSet.getString("description"),
                            resultSet.getInt("price"),
                            resultSet.getBoolean("is_available"),
                            resultSet.getString("image_path")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menu;
    }
}
