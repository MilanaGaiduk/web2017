<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<c:if test="${empty paramValues.lang}">
    <fmt:setLocale value="ru"/>
</c:if>
<c:if test="${param['lang'] eq 'ru'}">
    <fmt:setLocale value="ru"/>
</c:if>
<c:if test="${param['lang'] eq 'en'}">
    <fmt:setLocale value="en"/>
</c:if>
<c:if test="${param['lang'] eq 'de'}">
    <fmt:setLocale value="de"/>
</c:if>

<fmt:setBundle basename="myres"/>

<head>
    <title>Personal Area</title>
    <link rel='stylesheet' href='../../CSS/my_styles.css'>
    <script src='../../JS/my_cookies.js'></script>
</head>
<body>
    <c:import url="../header.jsp?lang=${param['lang']}"/>
    <h3><fmt:message key="user"/> <%=request.getRemoteUser()%></h3>
    <h3><fmt:message key="defaulttab"/>: ${initParam['checkedTab']}</h3>
</body>
</html>
