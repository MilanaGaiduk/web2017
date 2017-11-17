
package util;

import javax.servlet.http.HttpServletRequest;

public class Product {
    private String name;
    private String pr_id;
    private String image;
    private String visible;  //отображение в списке
    private String look;
    private String type;
    private int price;
    private Integer count;


    public Product() {}

    public Product(String name, String image,  String look, String type, int price, String id ){
        this.name=name;
        this.pr_id = id;
        this.image = image;
        this.look = look;
        this.price = price;
        this.type = type;
        this.visible = "none";
        this.count = 1;
    }

    public void setName(String name) {this.name = name;}
    public String getName() {return name;}

    public void setId(String id) {this.pr_id = id;}
    public String getId() {return pr_id;}

    public void setImage(String image) { this.image = image;}
    public String getImage() {return image;}

    public void setLook(String look) {this.look = look;}
    public String getLook() { return look;}

    public void setPrice(int price) { this.price = price; }
    public int getPrice() { return price; }

    public void setType(String type) { this.type = type;}
    public String getType() {return type; }

    public Integer getCount(){return count;}
    public void setCount(Integer val){count = val;}

    public void setVisible(HttpServletRequest request) {
        String str = request.getParameter("price_down");
        String str1 = request.getParameter("price_up");
        if (str != null) {
            if (!str.equals("")) {
                if (Integer.valueOf(str) > this.price) {
                    this.visible = "none";
                    return;
                }
            }
        }
        if (str1 != null) {
            if (!str1.equals("")) {
                if (Integer.valueOf(str1) < this.price) {
                    this.visible = "none";
                    return;
                }
            }
        }

        String s = "none";
        str = request.getParameter("blacktea");
        if (str != null) {
            if (!str.equals("")) {
                if (str.equals("on") && this.type.equals("blacktea")) {
                    s = "block";
                }
            }
        }
        str = request.getParameter("greentea");
        if (str != null) {
            if (!str.equals("")) {
                if (str.equals("on") && this.type.equals("greentea")) {
                    s = "block";
                }
            }
        }

        str = request.getParameter("alltypes");
        if (str != null) {
            if (!str.equals("")) {
                if (str.equals("on") && (this.type.equals("greentea")) || this.type.equals("blacktea")) {
                    s = "block";
                }
            }
        }

        if (str == null && str1 == null) {
            s = "block";
        }
        this.visible = s;
    }
    public String getVisible(){
        return visible;
    }
}
