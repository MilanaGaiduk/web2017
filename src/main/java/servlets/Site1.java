package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.LangGetter;
import util.*;

@WebServlet(name = "Site1", urlPatterns = {"/Site1"})


/**
 *
 * @author Milana
 */
public class Site1 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            ResourceBundle myres = LangGetter.getLang(request, response);

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Site1</title>");
            out.println("<link href=\"CSS/my_styles.css\" rel=\"stylesheet\">");
            out.println("</head>");
            out.println("<body>");

            out.println("<script src=\"JS/my_cookies.js\"></script>");

            out.println("<div class=\"upper_block\"><b>"+myres.getString("head")+"</b>\n" +
                    "    <div align=\"right\" id = \"namesite\">"+myres.getString("namesite")+"</div>\n" );
                    if (request.getRemoteUser() == null)
                        out.println("<h5 class=\"topbutton\">"+myres.getString("hello")+", "+myres.getString("anonym")+"</h5>\n");
                    else {
                        out.println("    <h5 class=\"topbutton\">"+myres.getString("hello")+", " + request.getRemoteUser() +"</h5>\n" +
                            "    <form action=/auth/personal_cabinet.jsp>\n" +
                            "        <button type=\"submit\">"+myres.getString("pers_cabinet") +
                            "        </button>\n" +
                            "    </form>\n" +
                            "    <form action=/logout>\n" +
                            "        <button type=\"submit\">"+myres.getString("logout") +
                            "        </button>\n" +
                            "    </form>\n" );
                    }
                    out.println("</div>");
           /* out.println("<input id =\"login\" class=\"topbutton\" style=\"left: 5%\" type=\"button\" value=" + myres.getString("login")+"/>\n" +
"        <input id =\"basket\" class=\"topbutton\" style=\"left: 15%\" type=\"button\" value=" + myres.getString("basket")+"/>\n" +
"        <input id =\"history\" class=\"topbutton\" style=\"left: 25%\" type=\"button\" value=" + myres.getString("buyhistory")+"/>");
            */

            out.println("<a style=\"left: 30%\" class=\"topbutton\" href= \"/auth/login.jsp?lang="+request.getParameter("lang")+ "\">"+myres.getString("login")+" </a>\n" +
                    "<a style=\"left: 40%\" class='topbutton'   href=\"/basket.jsp?lang="+request.getParameter("lang")+ "\">"+myres.getString("basket")+" </a>\n" +
                    "<a style=\"left: 50%\" class=\"topbutton\">"+myres.getString("buyhistory")+" </a>\n" +
                    "<a style=\"left: 70%\" class='topbutton'   href=\"/index.jsp?lang="+request.getParameter("lang")+ "\">"+myres.getString("list")+" </a>");

            out.println("<img class=\"picture\" src="+request.getParameter("image")+"/1"+">");
            out.println("<h1>" +myres.getString(request.getParameter("name"))
                    +"</h1>");
            out.println("<div class=\"tabs\">\n"
                    + "            <script type=\"text/javascript\"> \n"
                    + "                function changeText(value){\n"
                    + "                    document.getElementById('TextDiv').innerHTML = value; \n"
                    + "                } \n"
                    + "\n"
                   /* + "    function changeClass(b){\n"
                    + "        var allTabs = document.getElementById(\"show\",\"desc\",\"comments\");\n"
                    + "        for (i=0;i<allTabs.length; i++){\n"
                    + "            allTabs[i].className = \"buttons\";\n"
                    + "        }\n"
                    + "        b.className = \"buttons_clicked\"\n"
                    + "    }"*/
                    + "            </script> \n"
                    + "            \n"
                    + "            <input id=\"show\" class = \"buttons\" type='button' value="+ myres.getString("desct")
                    +" onclick=\"changeText('"+ myres.getString("desc")+"');  changeClass(this)\" /> \n"
                    + "            <input id=\" desc\" class = \"buttons\" type='button' value="+ myres.getString("lookt")
                    +" onclick=\"changeText('"+ myres.getString("look")+"'); changeClass(this)\" /> \n"
                    + "            <input id=\" comments\" class = \"buttons\" type='button' value="+ myres.getString("commentt")
                    +"  onclick=\"changeText('"+ myres.getString("comment")+"'); changeClass(this)"
                    + "\" /> \n"

                    + "            <div id='TextDiv'></div> \n"
                    +"            <script type=\"text/javascript\">"
                    + "document.getElementById('"
                    + getInitParameter("activeTab")
                    + "').onclick();\n"
                    + "</script>        \n"
                    + "</div>");
            out.println("<div id  = \"price\">" + myres.getString("price")+": "+request.getParameter("price")+ "</div>");
            out.println("<br><a  class = \"btn\" style=\"float:right;\" href=\"/PrCountChanger.jsp?id="+request.getParameter("id")+"&lang="+request.getParameter("lang")+"&do=inc\">"+myres.getString("buyb")+" </a>");



            //out.println("<div>"+request.getRequestURL()+'?'+request.getQueryString()+"</div>");

            out.println("      <a id = \"ru\" class = \"flags\" href= \"Site1?"+request.getQueryString()+"\" onclick=\"setCookie('lang', 'ru')\"><div left = 85%> <img src=\"images/flagRu.png\" alt=\"RU\" title=\"RU\"> </div></a>\n"
                    + "        <a id = \"en\" class = \"flags\" href= \"Site1?"+request.getQueryString()+"\" onclick=\"setCookie('lang', 'en')\"><div left = 90%> <img src=\"images/flagGB.jpg\" alt=\"EN\" title=\"EN\"> </div></a>\n"
                    + "        <a id = \"de\" class = \"flags\" href= \"Site1?"+request.getQueryString()+"\" onclick=\"setCookie('lang', 'de')\"><div left = 95%> <img src=\"images/flagDe.png\" alt=\"DE\" title=\"DE\"> </div></a>");


            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
