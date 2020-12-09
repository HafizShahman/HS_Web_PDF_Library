<%-- 
    Document   : history
    Created on : Nov 26, 2020, 2:18:23 AM
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
    String genre = request.getParameter("genre");
    String Email = request.getParameter("Email");
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
        <link rel="stylesheet" href="css/mainmenu.css">
    </head>
    <body>
        <div class="container">
            <form class="form-inline" method="post" action="search.jsp">
                <input type="text" name="genre" class="form-control" placeholder="Search genre">

                <button type="submit" name="save" class="btn btn-primary">Search</button>
            </form>
            <link rel="stylesheet" href="css/main.css">
            <link rel="stylesheet" href="css/login-register.css">
        </div>
        <h1>Book List</h1>
        <h2><%=resultSet.getString("Email")%></h2>
        <table border="1" bordercolor="#000000" align="center">
            <tr>

                <td>Book ID</td>
                <td>Book Title</td>
                <td>Date</td>

            </tr>
            <%
                try {
                    connection = DriverManager.getConnection(connectionUrl, userid, password);
                    statement = connection.createStatement();
                    String sql = "SELECT * FROM booklist WHERE Email='" + genre + "'";
                    resultSet = statement.executeQuery(sql);
                    while (resultSet.next()) {
            %>
            <tr>

                <td width="300"><%=resultSet.getString("bookid")%></td>
                <td width="300"><%=resultSet.getString("booktitle")%></td>
                <td width="150"><%=resultSet.getString("date")%></td>
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