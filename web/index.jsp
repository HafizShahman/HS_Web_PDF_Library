<%-- 
    Document   : index
    Created on : Nov 9, 2020, 9:10:01 PM
    Author     : hafiz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                background-color: navajowhite;
                text-align: center;
            }
            .btn {
                background-color: brown;
                border: none;
                color: aliceblue;
                padding: 5px 15px;
                text-align:center;
                display: inline-block;
                font-size: 15px;
                margin: 5px;
                cursor: pointer;
                border-radius: 12px;
            }
        </style>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/login-register.css">
    </head>
    <body style="background-image: url('../media/yellow-comic.jpg');">
    <center>
        <div class="main-content">
            <div class="container">
                <div class="form-register-with-email">
                    <div class="form-white-background">
                        <div class="main-content">
                            <h1> Hello, <%=session.getAttribute("login")%></h1>
                            <button><a href="logout.jsp">Logout</a></button>
                            <button class="btn"><a href="booklist.jsp">book list</a></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </center>
</body>
</html>
