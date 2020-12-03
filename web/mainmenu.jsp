<%-- 
    Document   : test2
    Created on : Nov 28, 2020, 11:00:48 PM
    Author     : hafiz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Full page scroll</title>
        <link rel="stylesheet" type="text/css" href="css/full-page-scroll.css" />
        <link rel="stylesheet" type="text/css" href="css/test2.css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="main" class="scroll-container">
            <section class="section1">
                <div id="t1">
                    <span>Welcome to Online PDF Library</span>
                </div>
                <br>
                <div class="main-content">
                    <h1> Hello, <%=session.getAttribute("login")%></h1>
                    <button class="btn"><a href="logout.jsp">Logout</a></button>
                </div>
                <div id="btn-row">
                    <button class="btn"><a href="booklist.jsp">book list</a></button>
                    <button class="btn"><a href="booklist.jsp">book list</a></button>
                </div>
            </section>
            <section class="section2">
                <div>
                    <span>Search Book</span>
                </div>
                <div>
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
            </section>
            <section class="section3">
                <div>
                    <span>Have A Nice Day 😘😘</span>
                </div>
            </section>
            <section class="section4">
                <div>
                    <span>Much Love From Me</span>
                </div>
            </section>
            <section class="section5">
                <div>
                    <span>💖💖</span>
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
                                animateFunction: "ease",
                            });
        </script>
    </body>
    <style type="text/css">
        .section1 {
            background-color: #7dbcd4;
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
