<%-- 
    Document   : ListItem
    Created on : Oct 14, 2017, 5:50:17 PM
    Author     : Milana
--%>

<%@page import="util.ProductGetter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*,javax.servlet.*,util.*" %>
<% ResourceBundle myres = LangGetter.getLang(request, response);
    Product[] pr = ProductGetter.getProducts(myres);
    Product prod = ProductGetter.getProduct(request.getParameter("name"), pr);
%>

<%!
    Locale locale = new Locale("ru");
    String language;
%>
<%
    language = request.getParameter("lang");
    if(language==null)language="ru";
    if(language.equals("ru"))locale = new Locale(language);
    if(language.equals("en"))locale = new Locale(language);
    if(language.equals("de"))locale = new Locale(language);
%>

<!DOCTYPE html>
<head>
    <title>An item of the list</title>
    <meta charset="UTF-8">
    <!--    <meta name="viewport" content="width=device-width, initial-scale=1.0">  -->
    <link href="CSS/my_styles.css" rel="stylesheet">
    <link href="CSS/button_styles.css" rel="stylesheet">

</head>
<body>
<div>
    <table>
        <tr>
            <td width="60%" rowspan="3">
                <a href="Site1?lang=<%= request.getParameter("lang")%>&price=<%= request.getParameter("price")%>&image=<%= request.getParameter("image")%>&name=<%= request.getParameter("name")%>&id=<%= request.getParameter("id")%>">
                    <img class ="picture_in_list" id="front_img" src="<%= request.getParameter("image")%>/1"></a></td>
            <td width="40%"  id="name"><h1><%= myres.getString(request.getParameter("name"))%></h1></td>

        </tr>
        <tr>

            <td width="40%">
                <%= myres.getString(request.getParameter("type"))%>
                <p><%= request.getParameter("look")%></p>
                <h2><%= myres.getString("price") + ": " + request.getParameter("price")%></h2>


                <%String r = request.getParameter("auth");%>
                <script>
                    function buuu(r){
                        //var a = request.getParameter("auth");
                        if(r !== null)
                        { document.getElementById("btnBuy").style.visibility = "visible"; }
                    }
                    buuu(r);
                </script>



                <a class='btn' id='btnBuy' style="float:right;" href="/PrCountChanger.jsp?id=<%out.print(prod.getId());%>&lang=<%out.print(language);%>&do=inc"> <%out.print(myres.getString("buyb"));%> </a>


            </td>
        </tr>
    </table>
</div>
</body>
