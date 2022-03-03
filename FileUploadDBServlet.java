import personalart_2021_22.*;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/FileUploadDBServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class FileUploadDBServlet extends HttpServlet {

    // database connection settings
    private String dbURL = "jdbc:mysql://195.251.249.131:3306";
    private String dbUser = "ismgroup53";
    private String dbPass = "k#n5n5";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // gets values of text fields
        InputStream inputStream = null; // input stream of the upload file

        // obtains the upload file part in this multipart request
        User user = (User)request.getSession(false).getAttribute("loggedin");
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }

        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client

        try {

              Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(dbURL,dbUser,dbPass);


            String sql =("INSERT INTO photos (email, pics) values (?, ?)");
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, user.getEmail());
            

            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(2, inputStream);
            }

            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded";
            }
        } catch (Exception  ex) {
            message = "ERROR: " + ex.getMessage();
             ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);

            // forwards to the message page
            getServletContext().getRequestDispatcher("/edit_artist_profile.jsp").forward(request, response);
        }
    }
}