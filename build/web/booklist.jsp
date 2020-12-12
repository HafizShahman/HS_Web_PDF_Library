<%-- 
    Document   : mainmenu
    Created on : Nov 21, 2020, 12:41:23 AM
    Author     : hafiz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/bookstore";
    String userid = "root";
    String password = "";
    String id = request.getParameter("txt_email");

    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>

<%
    try {
        connection = DriverManager.getConnection(connectionUrl, userid, password); //create connection

        if (request.getParameter("btndol") != null) {
            String bookid = request.getParameter("dwradio"); //txt_lastname

            PreparedStatement pstmt = null; //create statement

            pstmt = connection.prepareStatement("insert into userhistory(Email, bookid, booktitle, link) "
                    + "select storeuser.Email, booklist.bookid, booklist.booktitle, booklist.link "
                    + "from storeuser, booklist "
                    + "where storeuser.Email='" + session.getAttribute("login") + "' and booklist.link='" + bookid + "'"); //sql insert query
            pstmt.executeUpdate(); //execute query
            JOptionPane.showMessageDialog(null, "Database Success");
            connection.close(); //close connection
        }
    } catch (Exception e) {
        out.println(e);
        JOptionPane.showMessageDialog(null, "Database Link Failed");
    }
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
            <a href="mainmenu.jsp#2" class="btn-acc form-log-in-with-existing btn-three" id="btn-back-menu"><b>Main Menu</b></a>
            <center>
                <div class="main-content">
                    <div class="container">
                        <form class="form-inline" method="post" action="search.jsp">
                            <input type="text" name="val" class="form-control boxx" placeholder="Search...">
                            <select id="select" name="select" class="boxx"> 
                                <option selected="none">Please Select</option>
                                <option value="booktitle">Book Title</option> 
                                <option value="genre">Genre</option> 
                                <option value="year">Year</option> 
                            </select>
                            <button type="submit" name="save" class="btn btn-primary">Search</button>
                        </form>
                    </div>
                    <br>
                    <div>
                        <h3>User : <%=session.getAttribute("login")%></h3>
                    </div>
                    <br>
                    <h1>Book List</h1>
                    <br>
                    <table border="0.5" bordercolor="white" align="center">
                        <tr>
                            <td width="70">Book ID</td>
                            <td width="300">Book Title</td>
                            <td width="300">Author</td>
                            <td width="150">Book Genre</td>
                            <td width="70">Year Of Publish</td>
                            <td width="70">Link</td>
                        </tr>
                        <%
                            try {
                                connection = DriverManager.getConnection(connectionUrl, userid, password);
                                statement = connection.createStatement();
                                String sql = "SELECT * FROM `booklist` ORDER BY `booklist`.`bookid` ASC";
                                resultSet = statement.executeQuery(sql);
                                while (resultSet.next()) {
                        %>
                        <tr style="height:35px;background-color: rgba(49, 57, 73, 0.5);">
                            <td width="70" value="<%=resultSet.getString("bookid")%>" name="bID"><%=resultSet.getString("bookid")%></td>
                            <td width="300" value="<%=resultSet.getString("booktitle")%>" name="bTI"><%=resultSet.getString("booktitle")%></td>
                            <td width="300" value="<%=resultSet.getString("author")%>" name="au"><%=resultSet.getString("author")%></td>
                            <td width="150" value="<%=resultSet.getString("genre")%>" name="gg"><%=resultSet.getString("genre")%></td>
                            <td width="100" value="<%=resultSet.getString("year")%>" name="ye"><%=resultSet.getString("year")%></td>
                        <form id="u">
                            <td width="100" value="<%=resultSet.getString("link")%>" name="lin">
                                <input type="radio" name="dwradio" value="<%=resultSet.getString("link")%>" onclick="alert('<%=resultSet.getString("link")%>')">
                            </td>
                        </tr>
                            <%
                                    }
                                    connection.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                    JOptionPane.showMessageDialog(null, "Database Failed");
                                }
                            %>
                            <tr align="center">
                            <br>
                            <td colspan="6"><input type="submit" value="DOWNLOAD" name="bradio"></td>
                        </form>
                        </tr>
                    </table>


                </div>
            </center>
        </div>
    </body>
</html>
