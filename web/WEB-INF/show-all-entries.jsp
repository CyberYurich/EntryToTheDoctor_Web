<%-- 
    Document   : show-all-entries
    Created on : 15.10.2015, 14:58:47
    Author     : ALEX
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Entries to the doctor</title>
    </head>
    <body>
        <div>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Дата</th>
                        <th>Место в очереди</th>
                        <th>Фамилия</th>
                        <th>Имя</th>
                        <th>Отчество</th>
                        <th>Телефон</th>
                        <th>E-mail</th>
                        <th>Размер обуви</th>
                        <th>Модель товара</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${entries}" var="entry">
                        <tr>
                            <td><c:out value="${entry.id}"/></td>
                            <td><c:out value="${entry.date}"/></td>
                            <td><c:out value="${entry.placeInQueue}"/></td>
                            <td><c:out value="${entry.lastname}"/></td>
                            <td><c:out value="${entry.firstname}"/></td>
                            <td><c:out value="${entry.middlename}"/></td>
                            <td><c:out value="${entry.phone}"/></td>
                            <td><c:out value="${entry.email}"/></td>
                            <td><c:out value="${entry.shoeSize}"/></td>
                            <td><c:out value="${entry.productModel}"/></td>
                            <td>
                                <a href="delete-entry?id=${entry.id}">
                                    <img src="delete.png"/>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div>
            <c:out value="${message}"/>
        </div>
    </body>
</html>
