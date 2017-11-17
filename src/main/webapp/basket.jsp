<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="f" uri="WEB-INF/tlds/tag_lib.tld"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="util.Product"%>
<!DOCTYPE html>
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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type='text/css' rel='stylesheet' href='CSS/my_styles.css' />
    <title><fmt:message key="basket"/></title>
</head>
<body>
<c:import url="header.jsp?lang=${param['lang']}"/>
<div class="cart">
    <c:choose>
        <c:when test="${empty sessionScope.cart}">
            <div class="cartTitle"><fmt:message key="empty_basket"/></div>
        </c:when>
        <c:otherwise>
            <div class="cartTitle"><fmt:message key="basket"/></div>

            <c:set var="summ"  scope="page">0</c:set>
            <c:forEach var="elem" items="${sessionScope.cart}">
                <hr>
                <c:set var="t_price" scope="page"><fmt:message key="${elem.getPrice()}"></fmt:message></c:set>


                <div class="cartElem">
                    <div class="cartPicture">
                        <img src="<c:out value="${elem.getImage()}/1"/>" width="303" height="120" >
                    </div>
                    <div class="cartMain">
                        <b><fmt:message key="${elem.getName()}"/></b>

                        <br>
                        <div class="cartCount">
                            <fmt:message key="count"/>
                            <c:out value="${elem.getCount()} "/>
                            <a href="/PrCountChanger.jsp?id=${elem.getId()}&lang=${param['lang']}&do=inc"><c:out value="+"/></a>
                            <a href="/PrCountChanger.jsp?id=${elem.getId()}&lang=${param['lang']}&do=dec"><c:out value="-"/></a>
                        </div>
                        <br>


                        <fmt:message key="price"/> <fmt:formatNumber value="${elem.getPrice()*elem.getCount()}"/>
                    </div>
                </div>
                <c:set var="summ" scope="page">${summ+elem.getPrice()*elem.getCount()}</c:set>
            </c:forEach>
            <br><br>
            <div class='cartSumm' ><div class='cartSummText' ><fmt:message key="total_price"/> <fmt:formatNumber value="${summ}" /></div></div>
            <div>


                <% if (request.getRemoteUser() == null) {%>
                <a href="/auth/login.jsp?lang=${param['lang']}"><fmt:message key="order"/></a>
                <%} else {%>
                    <a href="/basket.jsp?lang=${param['lang']}"><fmt:message key="order"/></a>
                   <% }%>

            </div>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>

