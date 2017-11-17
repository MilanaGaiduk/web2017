package util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.http.Cookie;

public class LangGetter {

    public LangGetter() {
    }

    public static ResourceBundle getLang(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookie = request.getCookies();
        int lang = -1;
        for (int i = 0; i < cookie.length; ++i) {
            if (cookie[i].getName().equals("lang")) {
                lang = i;
                break;
            }
        }
        if (lang == -1) {
            javax.servlet.http.Cookie coc = new Cookie("lang", "ru");
            response.addCookie(coc);
            cookie = request.getCookies();
            lang = cookie.length - 1;
        }
        String s = cookie[lang].getValue();
        Locale loc = new Locale("ru");
        switch (s){
            case "ru":
                //loc = new Locale("ru");
                break;
            case "en":
                loc = new Locale("en");
                break;
            case "de":
                loc = new Locale("de");
                break;
        }
        ResourceBundle myres = ResourceBundle.getBundle("myres", loc);
        return myres;
    }
}
