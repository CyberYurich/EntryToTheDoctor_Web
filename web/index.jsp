<%-- 
    Document   : index
    Created on : 21.10.2015, 2:17:31
    Author     : ALEX
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Запись на прием к врачу</title>
        <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/moment-with-locales.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
        <script type="text/javascript" src="js/jquery.validate.min.js"></script>
        <script type="text/javascript" src="js/datetimepicker-config.js"></script>
        <script type="text/javascript" src="js/validate-config.js"></script>
        <script type="text/javascript" src="js/show-valid-times.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
        <link rel="stylesheet" href="css/style.css" />
    </head>
    <body>
        <div class="forma">
            <h3>Пожалуйста, введите данные:</h3>
            <form id="addEntry" action="add-entry" method="POST">
                <table>
                    <tbody>
                        <tr>
                            <td><label for="date">Дата <span style="color: #eb9316;">*</span>:</label></td>
                            <td><input type="text" id="date" name="date" value="<c:out value="${param.date}"/>" /></td>
                        </tr>
                        <tr>
                            <td><label for="time">Время <span style="color: #eb9316;">*</span>:</label></td>
                            <td><select id="time" name="time"></select></td>
                        </tr>
                        <tr>
                            <td><label for="lastName">Фамилия:</label></td>
                            <td><input type="text" id="lastName" name="lastName" value="<c:out value="${param.lastName}"/>" /></td>
                        </tr>
                        <tr>
                            <td><label for="firstName">Имя <span style="color: #eb9316;">*</span>:</label></td>
                            <td><input type="text" id="firstName" name="firstName" value="<c:out value="${param.firstName}"/>" /></td>
                        </tr>
                        <tr>
                            <td><label for="middleName">Отчество:</label></td>
                            <td><input type="text" id="middleName" name="middleName" value="<c:out value="${param.middleName}"/>" /></td>
                        </tr>
                        <tr>
                            <td><label for="phone">Телефон <span style="color: #eb9316;">*</span>:</label></td>
                            <td><input type="text" id="phone" name="phone" value="<c:out value="${param.phone}"/>" /></td>
                        </tr>
                        <tr>
                            <td><label for="email">Email:</label></td>
                            <td><input type="text" id="email" name="email" value="<c:out value="${param.email}"/>" /></td>
                        </tr>
                        <tr>
                            <td><label for="shoeSize">Размер обуви <span style="color: #eb9316;">*</span>:</label></td>
                            <td><input type="text" id="shoeSize" name="shoeSize" value="<c:out value="${param.shoeSize}"/>" /></td>
                        </tr>
                        <tr>
                            <td><label for="productModel">Модель стелек:</label></td>
                            <td>
                                <select id="productModel" name="productModel">
                                    <option>Консультация у врача</option>
                                    <option>FormThotics</option>
                                    <option>Extempo</option>
                                    <option>FootMaster</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Записаться" name="btnSave" class="button" /></td>
                            <td>&nbsp;</td>
                        </tr>
                    </tbody>
                </table>               
            </form>
        </div>
        <div>
            <c:out value="${message}"/>
        </div>
    </body>
</html>