package util;

import java.util.ResourceBundle;

public class ProductGetter {

    /* static public String[] getProducts() {
         String[] pr = new String[5];
         pr[0] = "ga";
         pr[1] = "hzc";
         pr[2] = "bh";
         pr[3] = "ap";
         pr[4] = "gk";
         return pr;
     }

     static public Product getProduct(String title, ResourceBundle res) {
         Product pr = null;

         switch (title) {
             case "ga":
                 pr = new Product("ga", "images/ga", res.getString("look"), "blacktea", 180);
                 break;
             case "hzc":
                 pr = new Product("hzc", "images/hzc", res.getString("look"), "greentea", 220);
                 break;
             case "bh":
                 pr = new Product("bh", "images/bh", res.getString("look"), "greentea", 195);
                 break;
             case "ap":
                 pr = new Product("ap", "images/ap", res.getString("look"), "blacktea", 240);
                 break;
             case "gk":
                 pr = new Product("gk", "images/gk", res.getString("look"), "greentea", 180);
                 break;
         }
         return pr;
     }
 */
    static public Product[] getProducts(ResourceBundle res) {
        Product[] pr = new Product[5];
        //String arr[] = {res.getString("teaname"), res.getString("desc"), res.getString("look"), res.getString("comment"), res.getString("buyb")};
        pr[0] = new Product("ga", "images/ga", res.getString("look"), "blacktea", 180, "0" );
        pr[1] = new Product("hzc", "images/hzc", res.getString("look_hzc"), "greentea",220, "1" );
        pr[2] = new Product("bh", "images/bh", res.getString("look_bh"), "greentea", 195, "2" );
        pr[3] = new Product("ap", "images/ap", res.getString("look_ap"), "blacktea", 240, "3" );
        pr[4] = new Product("gk", "images/gk", res.getString("look"), "greentea", 180, "4" );

        return pr;
    }

    static public Product getProduct(String name, Product[] pr) {
        Product prod = null;
        switch (name){
            case "ga":
                prod = pr[0];
                break;
            case "hzc":
                prod = pr[1];
                break;
            case "bh":
                prod = pr[2];
                break;
            case "ap":
                prod = pr[3];
                break;
            case "gk":
                prod = pr[4];
                break;
        }
        return prod;
    }
}
