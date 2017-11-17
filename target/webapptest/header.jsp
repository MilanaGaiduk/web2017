<%-- 
    Document   : table_head
    Created on : Oct 14, 2017, 5:53:32 PM
    Author     : Milana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*,javax.servlet.*,util.*" %>
<%

    Locale locale = new Locale("ru");
    String language;
    ResourceBundle myres;


    /*Cookie[] cookie = request.getCookies();
    int language1 = -1;
    for (int i = 0; i < cookie.length; ++i) {
        if (cookie[i].getName().equals("lang")) {
            language1 = i;
            break;
        }
    }
    String s = cookie[language1].getValue();
    language=s;//???*/

    language = request.getParameter("lang");

    if(language==null)language="ru";
    if(language.equals("ru"))locale = new Locale(language);
    if(language.equals("en"))locale = new Locale(language);
    if(language.equals("de"))locale = new Locale(language);
    myres = ResourceBundle.getBundle("myres", locale);
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="CSS/my_styles.css" rel="stylesheet">
    <title>Header of any page</title>
</head>
<body>
<div class="upper_block"><b><%= myres.getString("head")%></b>
    <div align="right" id = "namesite"><%= myres.getString("namesite")%></div>
    <% if (request.getRemoteUser() == null) {%>
    <h5 id="hi" class="topbutton"><%=myres.getString("hello")+", "%> <%=myres.getString("anonym")%></h5>
    <%} else {%>
    <h5 class="topbutton"><%=myres.getString("hello")+", "%> <%=request.getRemoteUser()%>
    </h5>

    <form action="/auth/personal_cabinet.jsp?lang=<%=request.getParameter("lang")%>">
        <button type="submit"><%=myres.getString("pers_cabinet")%>
        </button>
    </form>
    <form action=/logout>
        <button type="submit"><%=myres.getString("logout")%>
        </button>
    </form>
    <%}%>
</div>



<a id = "ru" class = "flags" href= "${request.getRequestURL()}?lang=ru" onclick="setCookie('lang', 'ru')"><div left = 85%> <img src="images/flagRu.png" alt="RU" title="RU"> </div></a>
<a id = "en" class = "flags" href= "${request.getRequestURL()}?lang=en" onclick="setCookie('lang', 'en')"><div left = 90%> <img src="images/flagGB.jpg" alt="EN" title="EN"> </div></a>
<a id = "de" class = "flags" href= "${request.getRequestURL()}?lang=de" onclick="setCookie('lang', 'de')"><div left = 95%> <img src="images/flagDe.png" alt="DE" title="DE"> </div></a>


<script>
    /* function makeVisibleBuy(){
         var bu = document.getElementById("btnBuy");
         for (var i=0; i<bu.length; i++)
             bu[i].style.visibility = "visible";
     }*/
</script>


<script>
    function makeVisibleBuy() {
        var elements = rootElement.getElementsByClassName("btn");
        for (var i=0; i<elements.length; i++)
            elements[i].style.visibility = "visible";
    }
</script>

<a style="left: 30%" class="topbutton" href= "/auth/personal_cabinet.jsp?lang=<%=request.getParameter("lang")%>"> <%out.print(myres.getString("login"));%> </a>
<a style="left: 40%" class='topbutton'   href="/basket.jsp?lang=<%=request.getParameter("lang")%>"> <%out.print(myres.getString("basket"));%> </a>
<a style="left: 50%" class="topbutton"> <%out.print(myres.getString("buyhistory"));%> </a>
<a style="left: 70%" class='topbutton'   href="/index.jsp?lang=<%=request.getParameter("lang")%>"> <%out.print(myres.getString("list"));%> </a>

</body>
</html>
