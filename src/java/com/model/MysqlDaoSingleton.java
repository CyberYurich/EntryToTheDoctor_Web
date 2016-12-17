/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

/**
 *
 * @author ALEX
 */
public class MysqlDaoSingleton {

    private final String PATIENTS_TABLE_NAME = "patients_entries";

    private final String URL = "jdbc:mysql://localhost:3306/entry_to_the_doctor";
    private final String USERNAME = "root";
    private final String PASSWORD = "root";

    private MysqlDaoSingleton() {
    }

    private static class MysqlDaoSingletonHolder {

        private static final MysqlDaoSingleton INSTANCE = new MysqlDaoSingleton();
    }

    public static MysqlDaoSingleton getInstance() {
        return MysqlDaoSingletonHolder.INSTANCE;
    }

    public void create(Date date,
            Time time,
            String lastname,
            String firstname,
            String middlename,
            String phone,
            String email,
            String shoeSize,
            String productModel)
            throws SQLException, ClassNotFoundException {

        String query = "insert into "
                + PATIENTS_TABLE_NAME
                + " (date,time,lastname,firstname,middlename,phone,email,shoe_size,product_model)"
                + " values (?,?,?,?,?,?,?,?,?)";
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        java.sql.Time sqlTime = new java.sql.Time(time.getTime());
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(query);) {
            statement.setDate(1, sqlDate);
            statement.setTime(2, sqlTime);
            statement.setString(3, lastname);
            statement.setString(4, firstname);
            statement.setString(5, middlename);
            statement.setString(6, phone);
            statement.setString(7, email);
            statement.setString(8, shoeSize);
            statement.setString(9, productModel);
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException ex) {
            throw ex;
        }
    }

    public Entry readById(int id) throws SQLException, ClassNotFoundException {
        String query = "select * from " + PATIENTS_TABLE_NAME + " where id = ?";
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(query);) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery();) {
                resultSet.next();
                return makeEntry(resultSet);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            throw ex;
        }
    }

    public List<Entry> readByDate(Date date) throws SQLException, ClassNotFoundException {
        String query = "select * from " + PATIENTS_TABLE_NAME + " where date = ?";
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(query);) {
            statement.setDate(1, sqlDate);
            try (ResultSet resultSet = statement.executeQuery();) {
                return makeEntriesList(resultSet);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            throw ex;
        }
    }

    public List<Entry> readAll() throws SQLException, ClassNotFoundException {
        String query = "select * from " + PATIENTS_TABLE_NAME;
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(query);
                ResultSet resultSet = statement.executeQuery();) {
            return makeEntriesList(resultSet);
        } catch (SQLException | ClassNotFoundException ex) {
            throw ex;
        }
    }

    public List<String> readTimesByDate(Date date) throws SQLException, ClassNotFoundException {
        String query = "select time from " + PATIENTS_TABLE_NAME + " where date = ?";
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(query);) {
            statement.setDate(1, sqlDate);
            try (ResultSet resultSet = statement.executeQuery();) {
                return makeTimesList(resultSet);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            throw ex;
        }
    }

    public void update(Entry entry) {
        //TODO
    }

    public void delete(int id) throws SQLException, ClassNotFoundException {
        String query = "delete from " + PATIENTS_TABLE_NAME + " where id = ?";
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(query);) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException ex) {
            throw ex;
        }
    }

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        Properties properties = new Properties();
        properties.setProperty("user", USERNAME);
        properties.setProperty("password", PASSWORD);
        properties.setProperty("useUnicode", "true");
        properties.setProperty("characterEncoding", "UTF-8");
        return DriverManager.getConnection(URL, properties);
    }

    private Entry makeEntry(ResultSet resultSet) throws SQLException {
        Entry entry = new Entry();
        entry.setId(resultSet.getInt(1));
        entry.setDate(resultSet.getDate(2));
        entry.setTime(resultSet.getTime(3));
        entry.setLastname(resultSet.getString(4));
        entry.setFirstname(resultSet.getString(5));
        entry.setMiddlename(resultSet.getString(6));
        entry.setPhone(resultSet.getString(7));
        entry.setEmail(resultSet.getString(8));
        entry.setShoeSize(resultSet.getString(9));
        entry.setProductModel(resultSet.getString(10));

        return entry;
    }

    private List<Entry> makeEntriesList(ResultSet resultSet) throws SQLException {
        List<Entry> list = new ArrayList<>();
        while (resultSet.next()) {
            list.add(makeEntry(resultSet));
        }
        return list;
    }

    private List<String> makeTimesList(ResultSet resultSet) throws SQLException {
        List<String> list = new ArrayList<>();
        while (resultSet.next()) {
            list.add(resultSet.getTime(1).toString());
        }
        return list;
    }
}
