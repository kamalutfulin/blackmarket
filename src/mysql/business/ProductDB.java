package mysql.business;

import java.sql.*;
import java.util.ArrayList;

public class ProductDB {

    private static String url = "jdbc:postgresql://192.168.1.106:5432/productdb";
    private static String username = "postgres";
    private static String password = "5101894";

    public static ArrayList<Product> select() {

        ArrayList<Product> products = new ArrayList<Product>();
        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, username, password)){

                Statement statement = conn.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM products");
                while(resultSet.next()){

                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    int price = resultSet.getInt("price");
                    Product product = new Product(id, name, price);
                    products.add(product);
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return products;
    }
    public static Product selectOne(int id) {

        Product product = null;
        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, username, password)){

                String sql = "SELECT name,price FROM products WHERE id=?";
                try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
                    preparedStatement.setInt(1, id);
                    ResultSet resultSet = preparedStatement.executeQuery();
                    if(resultSet.next()){

                        int prodId = resultSet.getInt("id");
                        String name = resultSet.getString("name");
                        int price = resultSet.getInt("price");
                        product = new Product(prodId, name, price);
                    }
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return product;
    }
    public static int insert(Product product) {

        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, username, password)){

                String sql = "INSERT INTO products (name, price) Values (?, ?)";
                try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
                    preparedStatement.setString(1, product.getName());
                    preparedStatement.setInt(2, product.getPrice());

                    return  preparedStatement.executeUpdate();
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return 0;
    }

    public static int update(Product product) {

        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, username, password)){

                String sql = "UPDATE products SET name = ?, price = ? WHERE id = ?";
                try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
                    preparedStatement.setString(1, product.getName());
                    preparedStatement.setInt(2, product.getPrice());
                    preparedStatement.setInt(3, product.getId());

                    return  preparedStatement.executeUpdate();
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return 0;
    }
    public static int delete(int id) {

        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, username, password)){

                String sql = "DELETE FROM products WHERE id = ?";
                try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
                    preparedStatement.setInt(1, id);

                    return  preparedStatement.executeUpdate();
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return 0;
    }
}