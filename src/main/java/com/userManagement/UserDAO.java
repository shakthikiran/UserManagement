package com.userManagement;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {


    private static final String INSERT_USERS_SQL = "INSERT INTO usermanagement" + "  (name, emailid, country) VALUES " + " (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,emailid,country from usermanagement where id =?";
    private static final String SELECT_ALL_USERS = "select * from usermanagement";
    private static final String DELETE_USERS_SQL = "delete from usermanagement where id = ?;";
    private static final String UPDATE_USERS_SQL = "update usermanagement set name = ?,emailid= ?, country =? where id = ?;";
    public UserDAO(){}

    protected Connection getConnection() throws SQLException {
        String url = "jdbc:postgresql://localhost:5432/mydatabase";
        String usename = "postgres";
        String password = "password";
        Connection connection= DriverManager.getConnection(url, usename, password);
        return connection;
    }

    public void addUser(User user){
        try(Connection connection=getConnection(); PreparedStatement statement=connection.prepareStatement(INSERT_USERS_SQL);) {
            statement.setString(1,user.getName());
            statement.setString(2,user.getEmail());
            statement.setString(3,user.getCountry());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<User> selectAllUser(){
        List<User> users=new ArrayList<>();
        try(Connection connection=getConnection(); PreparedStatement statement=connection.prepareStatement(SELECT_ALL_USERS)){
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("emailid");
                String country = resultSet.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return users;
    }

    public void deleteUser(int id) throws SQLException {
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }

    public void updateUser(User user) throws SQLException {
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setInt(4, user.getId());
            statement.executeUpdate();
        }
    }


}