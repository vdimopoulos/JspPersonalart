package personalart_2021_22;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Categoryprinter {

    public List<Category> getCategories() throws Exception {

        List<Category> categories = new ArrayList<Category>();
        DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sqlCheck = "SELECT * FROM categories";
		
		try{
		con = db.getConnection();
		stmt = con.prepareStatement(sqlCheck);
		rs = stmt.executeQuery();
		while (rs.next()) {
			Category category = new Category(rs.getString("categories.catname"), rs.getString("categories.imgsrc"),rs.getString("categories.cattext"));
			categories.add(category);
		}

		rs.close();
		stmt.close();
		db.close();

		return categories;

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