package personalart_2021_22;

public class Artist {
private String arfirstname;
private String arlastname;
private String aremail;

public Artist(String arfirstname, String arlastname, String aremail) {
    this.arfirstname = arfirstname;
    this.arlastname = arlastname;
    this.aremail = aremail;
}

public String getArfirstname() {
    return arfirstname;
}

public void setArfirstname(String arfirstname) {
    this.arfirstname = arfirstname;
}

public String getArlastname() {
    return arlastname;
}

public void setArlastname(String arlastname) {
    this.arlastname = arlastname;
}

public String getAremail() {
    return aremail;
}

public void setAremail(String aremail) {
    this.aremail = aremail;
}

}
