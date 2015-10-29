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
        <title>JSP Page</title>
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="js/moment-with-locales.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script> 
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
    </head>
    <body>
        <div>
            <h3>Форма записи для пациентов</h3>
            <form action="add-entry" method="POST">
                <table>
                    <tbody>
                        <tr>
                            <td><label for="date">Дата*:</label></td>
                            <td><input type="text" id="date" name="date" value="<c:out value="${param.date}"/>" /></td>
                        </tr>
                        <tr>
                            <td><label for="time">Время*:</label></td>
                            <td>
                                <select id="time" name="time">
                                    <option value="0">16:00</option>
                                    <option value="1">16:30</option>
                                    <option value="2">17:00</option>
                                    <option value="3">17:30</option>
                                    <option value="4">18:00</option>
                                    <option value="5">18:30</option>
                                    <option value="6">19:00</option>
                                    <option value="7">19:30</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="lastName">Фамилия*:</label></td>
                            <td><input type="text" id="lastName" class="string" name="lastName" value="<c:out value="${param.lastName}"/>" /></td>
                        </tr>
                        <tr>
                            <td><label for="firstName">Имя:</label></td>
                            <td><input type="text" id="firstName" class="string" name="firstName" value="<c:out value="${param.firstName}"/>" /></td>
                        </tr>
                        <tr>
                            <td><label for="middleName">Отчество:</label></td>
                            <td><input type="text" id="middleName" class="string" name="middleName" value="<c:out value="${param.middleName}"/>" /></td>
                        </tr>
                        <tr>
                            <td><label for="phone">Телефон*:</label></td>
                            <td><input type="text" id="phone" class="phone" name="phone" value="<c:out value="${param.phone}"/>" /></td>
                        </tr>
                        <tr>
                            <td><label for="email">Email:</label></td>
                            <td><input type="text" id="email" name="email" class="email" value="<c:out value="${param.email}"/>" /></td>
                        </tr>
                        <tr>
                            <td><label for="shoeSize">Размер обуви*:</label></td>
                            <td><input type="text" id="shoeSize" class="shoeSize" name="shoeSize" value="<c:out value="${param.shoeSize}"/>" maxlength="2" /></td>
                        </tr>
                        <tr>
                            <td><label for="productModel">Модель товара*:</label></td>
                            <td>
                                <select id="productModel" name="productModel">
                                    <option>Orthopedic shoes 1</option>
                                    <option>Orthopedic shoes 2</option>
                                    <option>Orthopedic shoes 3</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="submit" id="" value="Сохранить данные" name="btnSave" /></td>
                        </tr>
                    </tbody>
                </table>               
            </form>
        </div>
        <div>
            <c:out value="${message}"/>
        </div>
        <hr>
        <div>
            <h3>Список записей для администратора</h3>
            <form action="show-all-entries" method="GET">
                <input type="submit" value="Показать все записи"/>
            </form>
        </div>

        <script type="text/javascript">
            $(function () {
                $('#date').datetimepicker({
                    language: 'ru',
                    pickTime: false,
                    format: "YYYY-MM-DD",
                    daysOfWeekDisabled: [0, 1, 2, 4, 5]
                });
            });
        </script>

        <script type="text/javascript">

            $(document).ready(function () {

                $('.string').keypress(function (e) {
                    var key = (typeof e.charCode === 'undefined' ? e.keyCode : e.charCode);
                    if (e.ctrlKey || e.altKey || key < 32)
                        return true;
                    key = String.fromCharCode(key);
                    return /[\w\-\sА-Яа-я]/.test(key);
                });

                $('.phone').keypress(function (e) {
                    var key = (typeof e.charCode === 'undefined' ? e.keyCode : e.charCode);
                    if (e.ctrlKey || e.altKey || key < 32)
                        return true;
                    key = String.fromCharCode(key);
                    return /[\d\-\+]/.test(key);
                });

                $('.email').keypress(function (e) {
                    var key = (typeof e.charCode === 'undefined' ? e.keyCode : e.charCode);
                    if (e.ctrlKey || e.altKey || key < 32)
                        return true;
                    key = String.fromCharCode(key);
                    return /[\w\-@.]/.test(key);
                });

                $('.shoeSize').keypress(function (e) {
                    var key = (typeof e.charCode === 'undefined' ? e.keyCode : e.charCode);
                    if (e.ctrlKey || e.altKey || key < 32)
                        return true;
                    key = String.fromCharCode(key);
                    return /\d/.test(key);
                });
            });

        </script>

    </body>
</html>