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
                        <table border="0.5" bordercolor="white" align="center" width="50%">
                            <tr style="height:35px; color: white;">
                                <th width="300px">Name</th>
                                <th width="100px">Matric Number</th>
                                <th width="50px">Class</th>
                                <th width="40px">Social</th>
                            </tr>
                            <tr style="height:35px; background-color: rgba(49, 57, 73, 0.5); color: white;">
                                <td>Muhammad Hafiz Shahman Bin Mohd Nor Hisham</td>
                                <td>19DDT18F2070</td>
                                <td>DDT4A</td>
                                <td><a href="https://www.instagram.com/hfzshahman/"><img src="media/instagram.png" width=30px"></a></td>
                            </tr>
                            <tr style="height:35px; background-color: rgba(49, 57, 73, 0.5); color: white;">
                                <td>Lailyyana Binti Buyong</td>
                                <td>19DDT18F2100</td>
                                <td>DDT4A</td>
                                <td><a href="https://www.instagram.com/lailyyana/"><img src="media/instagram.png" width=30px"></a></td>
                            </tr>
                            <tr style="height:35px; background-color: rgba(49, 57, 73, 0.5); color: white;">
                                <td>Lukman Hakim Bin Ibrahim</td>
                                <td>19DDT18F2083</td>
                                <td>DDT4A</td>
                                <td><a href="https://www.instagram.com/1ukmanhakim/"><img src="media/instagram.png" width=30px"></a></td>
                            </tr>
                            <tr style="height:35px; background-color: rgba(49, 57, 73, 0.5); color: white;">
                                <td>Nadhrah Husna Binti Idris</td>
                                <td>19DDT18F1004</td>
                                <td>DDT5A</td>
                                <td><a href="https://www.instagram.com/ndhhhhh__/"><img src="media/instagram.png" width=30px"></a></td>
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
        @font-face {
            src: url("css/font/tricky jimmy.ttf");
            font-family: jim;
        }
        @font-face {
            src: url("css/font/OCR.ttf");
            font-family: ocr;
        }
        @font-face {
            src: url("css/font/EARTHQUAKE.TTF");
            font-family: ear;
        }
        @font-face {
            src: url("css/font/Ghost Story.otf");
            font-family: gho;
        }

        .section1 {
            background-image: url('media/star.gif');
            background-position: center center;
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        .section2 {
            background-image: url('media/menu.gif');
            background-position: center center;
            background-size: cover;
            background-repeat: no-repeat;

        }

        .section3 {
            background-image: url('media/mirror.jpg');
            background-position: center center;
            background-size: cover;
            background-repeat: no-repeat;
        }

        .section4 {
            background-image: url('media/sky.jpg');
            background-position: center center;
            background-size: cover;
            background-repeat: no-repeat;
        }

        .section5 {
            background-image: url('media/purplemoon.jpg');
            background-position: center center;
            background-size: cover;
            background-repeat: no-repeat;
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
            font-family: gho;
            font-style: normal;
            text-align: center;
            position: relative;
            top: 35%;
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
