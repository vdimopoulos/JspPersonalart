package personalart_2021_22;

public class Category {

    private String catname;
    private String imgsrc;
    private String cattext;

    public Category(String catname, String imgsrc, String cattext) {
        this.catname = catname;
        this.imgsrc = imgsrc;
        this.cattext = cattext; 
    }

    public String getCatname() {
        return catname;
    }

    public String getImgsrc() {
        return imgsrc;
    }

    public String getCattext() {
        return cattext;
    }



}