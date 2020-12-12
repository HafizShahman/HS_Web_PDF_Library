<%-- 
    Document   : mainmenu
    Created on : Nov 21, 2020, 12:41:23 AM
    Author     : hafiz

--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/bookstore";
    String userid = "root";
    String password = "";
    String val = request.getParameter("val");
    String select = request.getParameter("select");
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Library</title>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/mainmenu.css">

        <style>
            body{
                background-image: url('media/star.gif');
                background-position: center center;
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }

        </style>
    </head>
    <body>
        <div class="form-register-with-email">
            <a href="mainmenu.jsp#3" class="btn-acc form-log-in-with-existing btn-three" id="btn-back-menu"><b>Main Menu</b></a>
            <center>
                <div class="main-content">


                    <div class="container">
                        <form class="form-inline" method="post" action="search.jsp">
                            <input type="text" name="val" class="form-control boxx" placeholder="Search...">
                            <select id="select" name="select" class="boxx"> 
                                <option selected="none">Select one</option>
                                <option value="booktitle">Book Title</option> 
                                <option value="genre">Genre</option> 
                                <option value="year">Year</option> 
                            </select>
                            <button type="submit" name="save" class="btn btn-primary" onclick="getOption()">Search</button>
                        </form>
                    </div>
                    <br>
                    <div>
                        <h3>User : <%=session.getAttribute("login")%></h3>
                    </div>
                    <br>
                    <h1>User Download History</h1>
                    <br>
                    <table border="0.5" bordercolor="white" align="center">
                        <tr>
                            <td width="70">Book ID</td>
                            <td width="300">Book Title</td>
                            <td width="70">Link</td>
                        </tr>
                        <%
                            try {
                                connection = DriverManager.getConnection(connectionUrl, userid, password);
                                statement = connection.createStatement();
                                String sql = "SELECT * FROM userhistory WHERE Email='" + session.getAttribute("login") + "'";
                                resultSet = statement.executeQuery(sql);
                                while (resultSet.next()) {
                        %>
                        <tr style="height:35px;background-color: rgba(49, 57, 73, 0.5);">
                            <td width="70"><%=resultSet.getString("bookid")%></td>
                            <td width="300"><%=resultSet.getString("booktitle")%></td>
                            <td width="100"><button id="btndw" onclick="btninsert()"><a href="<%=resultSet.getString("link")%>">Download</a></button></td>
                        </tr>
                        <%
                                }
                                connection.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </table>
                </div>
            </center>
        </div>
    </body>
</html>
