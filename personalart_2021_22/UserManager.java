package personalart_2021_22;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserManager {

    public void register(User user) throws Exception {
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        String sqlCheck = "SELECT * from user WHERE email=?";

        String sql = "INSERT INTO user (name, surname, password, email) " 
            + " VALUES (?, ?, ?, ?)";

        try {
            
            con = db.getConnection();

            stmt = con.prepareStatement(sqlCheck);
            stmt.setString(1, user.getEmail());

            rs = stmt.executeQuery();

            if ( rs.next() ) {
                rs.close();
                stmt.close();
                throw new Exception("Sorry, email already registered");

            }

            stmt = con.prepareStatement(sql);

            // setting parameters
            stmt.setString(1, user.getFirstname());
            stmt.setString(2, user.getLastname());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getEmail());

            stmt.executeUpdate();

            stmt.close();
            db.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {

            try {
                db.close();
            } catch (Exception e) {
                
            }

        }

    }


    public User authenticate(String email, String password) throws Exception {
		DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM user WHERE email=? AND password=?;";

        try {
            
            con = db.getConnection();
            stmt = con.prepareStatement(sql);

            // setting parameters
            stmt.setString(1, email);
            stmt.setString(2, password);

            rs = stmt.executeQuery();

            if ( !rs.next() ) {

                throw new Exception("Wrong email or password");

            }

            User user = new User( rs.getString("user.name"),
                rs.getString("user.surname"), rs.getString("user.email"), rs.getString("user.password") );

            rs.close();
            stmt.close();
            db.close();
            
            return user;

        } catch (Exception e) {
            
            throw new Exception(e.getMessage());

        } finally {

            try {
                db.close();
            } catch (Exception e) {
                
            }

        }

    }
    public User findUser(String email) throws Exception {
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM user WHERE email=?";

        try {
            
            con = db.getConnection();
            stmt = con.prepareStatement(sql);

            // setting parameters
            stmt.setString(1, email);
            rs = stmt.executeQuery();

            if ( !rs.next() ) {

                throw new Exception("Wrong email");

            }

            User user = new User( rs.getString("user.name"),
                rs.getString("user.surname"), rs.getString("user.email"), rs.getString("user.password") );

            rs.close();
            stmt.close();
            db.close();
            
            return user;

        } catch (Exception e) {
            
            throw new Exception(e.getMessage());

        } finally {

            try {
                db.close();
            } catch (Exception e) {
                
            }
        
        }

    }
}    