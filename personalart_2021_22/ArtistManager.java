package personalart_2021_22;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ArtistManager {

    public void registerArtist(Artist artist) throws Exception {
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;

        String sql = "INSERT INTO artist (name, surname, email) " 
            + " VALUES (?, ?, ?)";

            try {
                con = db.getConnection();
                stmt = con.prepareStatement(sql);
                stmt.setString(1, artist.getArfirstname());
                stmt.setString(2, artist.getArlastname());
                stmt.setString(3, artist.getAremail());
                

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

    public Artist findArtist(String email) throws Exception {
        
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM artist WHERE email=?";

        try {	
            
            con = db.getConnection();
            stmt = con.prepareStatement(sql);

            // setting parameters
            stmt.setString(1, email);
            rs = stmt.executeQuery();

            if ( !rs.next() ) {
				rs.close();
				stmt.close();
				db.close();
            	return null;

            } else {

            Artist artist = new Artist( rs.getString("artist.name"),
                rs.getString("artist.surname"), rs.getString("artist.email"));

            rs.close();
            stmt.close();
            db.close();
            
            return artist; }

        } catch (Exception e) {
            
            throw new Exception(e.getMessage());

        } finally {

            try {
                db.close();
            } catch (Exception e) {
                
            }

        }

    }

    public List<ArtistProfile> getCatArtists(String catname) throws Exception {
        List<ArtistProfile> artists = new ArrayList<ArtistProfile>();
        DB db = new DB();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sqlCheck = "SELECT * FROM artistprofile WHERE prefcategory = ?";
		
		try{
		con = db.getConnection();
		stmt = con.prepareStatement(sqlCheck);
        stmt.setString(1, catname);
		rs = stmt.executeQuery();
		if ( !rs.next() ) {
            rs.close();
            stmt.close();
            db.close();
            return null;
        } else {
        while (rs.next()) {
			ArtistProfile profile = new ArtistProfile(rs.getString("artistprofile.name"), rs.getString("artistprofile.surname"),rs.getString("artistprofile.email"), 
            rs.getString("artistprofile.tattooshop"), rs.getString("artistprofile.phonenumber"), rs.getString("artistprofile.prefcategory"));
			artists.add(profile);
		}

		rs.close();
		stmt.close();
		db.close();

		return artists; }
		
    } catch (Exception e) {
		throw new Exception(e.getMessage());
		} finally {
		try {
		db.close();
		} catch (Exception e) {
		
			}
		}
    }

    public ArtistProfile getProfile(String email) throws Exception {
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM artistprofile WHERE email=?";

        try {	
            
            con = db.getConnection();
            stmt = con.prepareStatement(sql);

            // setting parameters
            stmt.setString(1, email);
            rs = stmt.executeQuery();

            if ( !rs.next() ) {
				rs.close();
				stmt.close();
				db.close();
            	return null;

            } else {

            ArtistProfile artistpr = new ArtistProfile( rs.getString("artistprofile.name"),
                rs.getString("artistprofile.surname"), rs.getString("artistprofile.email"), rs.getString("artistprofile.tattooshop"), 
                rs.getString("artistprofile.phonenumber"), rs.getString("artistprofile.prefcategory"));

            rs.close();
            stmt.close();
            db.close();
            
            return artistpr; }

        } catch (Exception e) {
            
            throw new Exception(e.getMessage());

        } finally {

            try {
                db.close();
            } catch (Exception e) {
                
            }

        }


    }

    public void createProfile(String name, String surname, String email, String tattooshop, String phonenumber, String prefcategory) throws Exception {
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;

        String sql = "INSERT INTO artistprofile (name, surname, email, tattooshop, phonenumber, prefcategory) " 
            + " VALUES (?, ?, ?, ?, ?, ?)";

            try {
                con = db.getConnection();
                stmt = con.prepareStatement(sql);
                stmt.setString(1, name);
                stmt.setString(2, surname);
                stmt.setString(3, email);
                stmt.setString(4, tattooshop);
                stmt.setString(5, phonenumber);
                stmt.setString(6, prefcategory);
                

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
    
    public void updateProfile(String prevemail,String name, String surname, String email, String tattooshop, String phonenumber, String prefcategory) throws Exception {
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        PreparedStatement stmt2 = null;
        PreparedStatement stmt3 = null;

        String sql1 = "UPDATE artistprofile SET name = ?, surname = ?, email = ?, tattooshop = ?, phonenumber = ?, prefcategory = ? WHERE email = ?";
        String sql2 = "UPDATE user SET name = ?, surname = ?, email = ? where email = ?";
        String sql3 = "UPDATE artist SET name = ?, surname = ?, email = ? where email = ?";

            try {
                con = db.getConnection();
                stmt = con.prepareStatement(sql1);
                stmt2 = con.prepareStatement(sql2);
                stmt3 = con. prepareStatement(sql3);
                stmt.setString(1, name);
                stmt.setString(2, surname);
                stmt.setString(3, email);
                stmt.setString(4, tattooshop);
                stmt.setString(5, phonenumber);
                stmt.setString(6, prefcategory);
                stmt.setString(7, prevemail);
                stmt2.setString(1, name);
                stmt2.setString(2, surname);
                stmt2.setString(3, email);
                stmt2.setString(4, prevemail);
                stmt3.setString(1, name);
                stmt3.setString(2, surname);
                stmt3.setString(3, email);
                stmt3.setString(4, prevemail);
                

                stmt.executeUpdate();
                stmt2.executeUpdate();
                stmt3.executeUpdate();

                stmt.close();
                stmt2.close();
                stmt3.close();
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
    

}
        

