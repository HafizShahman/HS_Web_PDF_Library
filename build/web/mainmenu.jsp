<%-- 
    Document   : test2
    Created on : Nov 28, 2020, 11:00:48 PM
    Author     : hafiz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Main Menu</title>
        <link rel="stylesheet" type="text/css" href="css/full-page-scroll.css" />
        <link rel="stylesheet" type="text/css" href="css/mainmenu.css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="main" class="scroll-container">
            <section class="section1">
                <div id="t1">
                    <span>Welcome to Online PDF Library</span>
                </div>
                <div class="main-content">
                    <h1> Hello, <%=session.getAttribute("login")%></h1>
                </div><br><br><br>
                <div class="form-register-with-email" style="margin-bottom: 90px;">
                    <a href="logout.jsp" class="btn-acc form-log-in-with-existing btn-two"><b>Logout</b></a><br>
                </div>
                <div class="imgbox">
                    <img src="media/scroll-down.png" class="imgdown" width="100px" height="100px" style="overflow: hidden;">
                </div>

            </section>


            <section class="section2">
                <div>
                    <span>Search Book</span>
                </div>
                <div>
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
            </section>


            <section class="section3">
                <div>
                    <span>Go to Library</span>
                </div>
                <br>
                <div class="form-register-with-email">
                    <a href="booklist.jsp" class="btn-acc form-log-in-with-existing btn-one"><b>Book List</b></a>
                </div>
            </section>


            <section class="section4">
                <div>
                    <span>Go to User History</span>
                </div>
                <br>
                <div class="form-register-with-email">
                    <a href="history.jsp" class="btn-acc form-log-in-with-existing btn-one"><b>History</b></a>
                </div>
            </section>


            <section class="section5">
                <div>
                    <center>
                        <table border="1" bordercolor="white" align="center" width="50%">
                            <tr>
                                <td width="300px">Name</td>
                                <td width="100px">Matric Number</td>
                                <td width="50px">Class</td>
                            </tr>
                            <tr>
                                <td>Muhammad Hafiz Shahman Bin Mohd Nor Hisham</td>
                                <td>19DDT18F2070</td>
                                <td>DDT4A</td>
                            </tr>
                            <tr>
                                <td>Lailyyana Binti Buyong</td>
                                <td>19DDT18F2100</td>
                                <td>DDT4A</td>
                            </tr>
                            <tr>
                                <td>Lukman Hakim Bin Ibrahim</td>
                                <td>19DDT18F2083</td>
                                <td>DDT4A</td>
                            </tr>
                            <tr>
                                <td>Nadhrah Husna Binti Idris</td>
                                <td>19DDT18F1004</td>
                                <td>DDT5A</td>
                            </tr>
                        </table>
                    </center>
                </div>
            </section>
        </div>
        <script src="javascript/full-page-scroll.js"></script>
        <script type="text/javascript">
                            new fullScroll({
                                mainElement: "main",
                                displayDots: true,
                                dotsPosition: "left",
                                animateTime: 0.7,
                                animateFunction: "ease"
                            });
        </script>
    </body>
    <style type="text/css">
        .section1 {
            background-image: url('media/star.gif');
            background-position: center center;
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        .section2 {
            background-color: #98c19f;
        }

        .section3 {
            background-color: #a199e2;
        }

        .section4 {
            background-color: #cc938e;
        }

        .section5 {
            background-color: #d2c598;
        }

        section div {
            font-family: "Open Sans";
            font-style: normal;
            text-align: center;
            position: relative;
            top: 45%;
            transform: translateY(-50%);
        }
        section #t1 {
            font-family: "Open Sans";
            font-style: normal;
            text-align: center;
            position: relative;
            top: 40%;
            transform: translateY(-50%);
        }
        section #btn-row {
            font-family: "Open Sans";
            font-style: normal;
            text-align: center;
            position: relative;
            top: 50%;
            transform: translateY(-50%);
        }

        span {
            font-size: 4em;
            font-style: normal;
            color: #fff;
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

        /*---------------------------------------------*/

    </style>
</html>
