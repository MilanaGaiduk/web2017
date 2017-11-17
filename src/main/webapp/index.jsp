<%--
    Document   : index
    Created on : Oct 14, 2017, 5:42:28 PM
    Author     : Milana
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.util.*, java.text.*,javax.servlet.*,util.*" %>
<jsp:useBean id="items" class="beans.listBean" scope="page"  />
<%
   // ResourceBundle myres = LangGetter.getLang(request, response);

    Locale locale = new Locale("ru");
    String language;
    ResourceBundle myres;

    language = request.getParameter("lang");

    if(language==null)language="ru";
    if(language.equals("ru"))locale = new Locale(language);
    if(language.equals("en"))locale = new Locale(language);
    if(language.equals("de"))locale = new Locale(language);
    myres = ResourceBundle.getBundle("myres", locale);

    items.setPr(ProductGetter.getProducts(myres));
    items.setVisible(request);

%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="CSS/my_styles.css" rel="stylesheet">
    <title>List of products</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<form method="GET" id="filter">
    <p><%= myres.getString("price")%></p>
    <p><%= myres.getString("from")%>: <input type="text" style="width: 50px" name="price_down" oninput="price_input(this)">
        <%= myres.getString("to")%>:<input type="text" style="width: 50px" name="price_up" oninput="price_input(this)">
    </p>
    <p><input type="checkbox" name="alltypes" onclick="setCheckParam(this)"><%= myres.getString("alltypes")%></p>
    <p><input type="checkbox" name="blacktea" onclick="setCheckParam(this)"><%= myres.getString("blacktea")%></p>
    <p><input type="checkbox" name="greentea" onclick="setCheckParam(this)"><%= myres.getString("greentea")%></p>


    <!--<select name='All kinds'>
                <option value='one' onchange="setCheckParam(this)"><%= myres.getString("alltypes")%></option>
                <option value='two' onchange="setCheckParam(this)"><%= myres.getString("blacktea")%></option>
                <option value='three' onchange="setCheckParam(this)"><%= myres.getString("greentea")%></option>
            </select> -->


    <input type="submit" value="<%= myres.getString("apply")%>">
</form>


<ol>

    <% for (int i = 0; i < items.getPr().length; ++i) {%>
    <li style="display: <%= items.getPr()[i].getVisible()%> ">
        <div>
            <jsp:include page="ListItem.jsp" >
                <jsp:param name="name" value="<%= items.getPr()[i].getName()%>" />
                <jsp:param name="image" value="<%= items.getPr()[i].getImage()%>" />
                <jsp:param name="price" value="<%= items.getPr()[i].getPrice()%>" />
                <jsp:param name="look" value="<%= items.getPr()[i].getLook()%>" />
                <jsp:param name="type" value="<%= items.getPr()[i].getType()%>" />
                <jsp:param name="id" value="<%= items.getPr()[i].getId()%>" />
            </jsp:include>
        </div>
    </li>
    <% }%>

    <script src="JS/my_cookies.js"></script>
    <script>
        function int_input(a) {
            if (a >= '0' && a <= '9')
                return true;
            return false;
        }
        function price_input(obj) {
            for (var i = 0, max = obj.value.length; i < max; i++) {
                if (!int_input(obj.value[i]))
                {
                    obj.value = "";
                }
            }
            setTextParam(obj);
        }
        getFilter();
    </script>
</ol>
</body>
</html>
