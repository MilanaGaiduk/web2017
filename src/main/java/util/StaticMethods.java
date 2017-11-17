package util;

import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import util.*;

public class StaticMethods {

    /**
     *
     * @param s
     * @return
     */
    public static Map getCook(String s) {
        int k = s.lastIndexOf("basket");
        StringBuffer st = new StringBuffer();
        for (int i = k + 7; i < s.length(); i++) {
            char p = s.charAt(i);
            if (p == ';' || p == ',') {
                break;
            }
            st.append(p);
        }
        Map m = new HashMap<String, String>();
        String[] tt = st.toString().split("~");
        if (!st.toString().equals("")) {
            for (int i = 0; i < tt.length; i++) {
                String[] string = tt[i].split(":");
                m.put(string[0], string[1]);
            }
        }
        return m;
    }

    public static String getPrice(ResourceBundle myres, String col) {
        Product[] pr = ProductGetter.getProducts(myres);
        int c = ProductGetter.getProduct("hzc",pr).getPrice();      //!!!!!!!!!!!
        int count = Integer.parseInt(col);
        return String.valueOf(c * count);
    }

   /* public static String getFullCost(Map<String,String> m){
        int summ = 0;
        for (Map.Entry entry : m.entrySet()) {
            summ += Integer.valueOf(getPrice(entry.getKey().toString(),entry.getValue().toString()));
        }
        return String.valueOf(summ);
    }*/
}
