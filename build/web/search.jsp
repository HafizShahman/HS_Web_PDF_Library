<%-- 
    Document   : mainmenu
    Created on : Nov 21, 2020, 12:41:23 AM
    Author     : hafiz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/booklist-box.css">
        <style>
            body {
                background-color: navajowhite;
                background-image: url("yellow-comic.jpg");
                    text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <form class="form-inline" method="post" action="search.jsp">
                <input type="text" name="val" class="form-control" placeholder="Search...">
                <select id="select" name="select"> 
                    <option selected="none">Select one</option>
                    <option value="booktitle">Book Title</option> 
                    <option value="genre">Genre</option> 
                    <option value="year">Year</option> 
                </select>
                <button type="submit" name="save" class="btn btn-primary" onclick="getOption()">Search</button>
            </form>
        </div>
        <h1>Book List</h1>
        <table border="1" bordercolor="#000000" align="center">
            <tr>
                <td>Book ID</td>
                <td>Book Title</td>
                <td>Author</td>
                <td>Book Genre</td>
                <td>Year Of Publish</td>
                <td>Link</td>
            </tr>
            <%
                try {
                    connection = DriverManager.getConnection(connectionUrl, userid, password);
                    statement = connection.createStatement();
                    String sql = "SELECT * FROM booklist WHERE " + select + " LIKE '%" + val + "%'";
                    resultSet = statement.executeQuery(sql);
                    while (resultSet.next()) {
            %>
            <tr>
                <td width="70"><%=resultSet.getString("bookid")%></td>
                <td width="300"><%=resultSet.getString("booktitle")%></td>
                <td width="300"><%=resultSet.getString("author")%></td>
                <td width="150"><%=resultSet.getString("genre")%></td>
                <td width="70"><%=resultSet.getString("year")%></td>
                <td width="100"><button><a href="<%=resultSet.getString("link")%>">Download</a></button></td>
            </tr>
            <%
                    }
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
    </body>
</html>
