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
        <script>
            function btninsert() {
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver"); //load driver

                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", ""); //create connection

                    if (request.getParameter("btn_register") != null) //check register button click event not null
                    {
                        String Name, Address, PhoneNo, Email, Password;

                        Name = request.getParameter("txt_name"); //txt_firstname
                        Address = request.getParameter("txt_address"); //txt_lastname
                        PhoneNo = request.getParameter("txt_phone"); //txt_lastname
                        Email = request.getParameter("txt_email"); //txt_email
                        Password = request.getParameter("txt_password"); //txt_password

                        PreparedStatement pstmt = null; //create statement

                        pstmt = con.prepareStatement("insert into storeuser(Name,Address,PhoneNo,Email,Password) values(?,?,?,?,?)"); //sql insert query
                        pstmt.setString(1, Name);
                        pstmt.setString(2, Address);
                        pstmt.setString(3, PhoneNo);
                        pstmt.setString(4, Email);
                        pstmt.setString(5, Password);

                        pstmt.executeUpdate(); //execute query

                        request.setAttribute("successMsg", "Register Successfully...! Please login"); //register success messeage

                        con.close(); //close connection
                    }
                } catch (Exception e) {
                    out.println(e);
                }
            %>
            }
        </script>
    </head>
    <body>
        <div class="form-register-with-email">
            <a href="mainmenu.jsp#1" class="btn-acc form-log-in-with-existing btn-three" id="btn-back-menu"><b>Main Menu</b></a>
            <a href="booklist.jsp" class="btn-acc form-log-in-with-existing btn-three" id="btn-back-menu"><b>Back To Full List</b></a>
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
                                String sql = "SELECT * FROM booklist WHERE " + select + " LIKE '%" + val + "%'";
                                resultSet = statement.executeQuery(sql);
                                while (resultSet.next()) {
                        %>
                        <tr style="height:35px;background-color: rgba(49, 57, 73, 0.5);">
                            <td width="70"><%=resultSet.getString("bookid")%></td>
                            <td width="300"><%=resultSet.getString("booktitle")%></td>
                            <td width="300"><%=resultSet.getString("author")%></td>
                            <td width="150"><%=resultSet.getString("genre")%></td>
                            <td width="100"><%=resultSet.getString("year")%></td>
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
