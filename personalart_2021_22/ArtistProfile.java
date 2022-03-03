package personalart_2021_22;

public class ArtistProfile {
    private String name;
    private String surname;
    private String email;
    private String tattooshop;
    private String phonenumber;
    private String prefcategory;

    public ArtistProfile(String name, String surname, String email, String tattooshop, String phonenumber, String prefcategory) {
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.tattooshop = tattooshop;
        this.phonenumber = phonenumber;
        this.prefcategory = prefcategory;
    }
    
    public String getprfirstname() {
        return name;
    }
    
    public void setprfirstname(String name) {
        this.name = name;
    }

    public String getprlastname() {
        return surname;
    }
    
    public void setprlastname(String surname) {
        this.surname = surname;
    }

    public String getpremail() {
        return email;
    }
    
    public void setpremail(String email) {
        this.email = email;
    }

    public String getprtattooshop() {
        return tattooshop;
    }
    
    public void setprtattooshop(String tattooshop) {
        this.tattooshop = tattooshop;
    }

    public String getprphonenumber() {
        return phonenumber;
    }
    
    public void setprphonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getprprefcategory() {
        return prefcategory;
    }
    
    public void setprprefcategory(String prefcategory) {
        this.prefcategory = prefcategory;
    }

    
}