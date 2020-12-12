<%-- 
    Document   : RegisterPage
    Created on : Nov 12, 2020, 10:17:09 PM
    Author     : hafiz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("login") != null) //check login session user not access or back to register.jsp page
    {
        response.sendRedirect("mainmenu.jsp");
    }
%>
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registration Form</title>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/login-register.css">

        <!-- javascript for registration form validation-->
        <script>

            function validate()
            {
                var Name = /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
                var add_ress = /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
                var phone_no = /^[0-9]+$/; //pattern allowed number 0-9
                var email_valid = /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/; //pattern valid email validation
                var password_valid = /^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/; //pattern password allowed A to Z, a to z, 0-9, !@#$%&*()<> charecter 

                var Name = document.getElementById("Name"); //textbox id Name
                var address = document.getElementById("address"); //textbox id address
                var phonen = document.getElementById("phonen"); //textbox id address
                var email = document.getElementById("email"); //textbox id email
                var password = document.getElementById("password"); //textbox id password

                if (!first_name.test(Name.value) || Name.value === '')
                {
                    alert("Enter Firstname Alphabet Only....!");
                    Name.focus();
                    Name.style.background = '#f08080';
                    return false;
                }
                if (!add_ress.test(address.value) || address.value === '')
                {
                    alert("Enter Address Alphabet Only....!");
                    address.focus();
                    address.style.background = '#f08080';
                    return false;
                }
                if (!phone_no.test(phonen.value) || phonen.value === '')
                {
                    alert("Enter Phone Nunber Only....!");
                    phonen.focus();
                    phonen.style.background = '#f08080';
                    return false;
                }
                if (!email_valid.test(email.value) || email.value === '')
                {
                    alert("Enter Valid Email....!");
                    email.focus();
                    email.style.background = '#f08080';
                    return false;
                }
                if (!password_valid.test(password.value) || password.value === '')
                {
                    alert("Password Must Be 6 to 12 and allowed !@#$%&*()<> character");
                    password.focus();
                    password.style.background = '#f08080';
                    return false;
                }
            }

        </script>	
    </head>
    <body>
        <div class="main-content">
            <form class="form-register" method="post" onsubmit="return validate();">
                <div class="form-register-with-email">
                    <div class="form-white-background">
                        <div class="form-title-row">
                            <h1>Register</h1>
                        </div>
                        <p style="color:green">				   		
                            <%
                                if (request.getAttribute("successMsg") != null) {
                                    out.println(request.getAttribute("successMsg")); //register success message
                                }
                            %>
                        </p>
                        </br>

                        <div class="form-row">
                            <label>
                                <span>Name</span>
                                <input type="text" name="txt_name" id="Name" placeholder="enter name">
                            </label>
                        </div>

                        <div class="form-row">
                            <label>
                                <span>Address</span>
                                <input type="text" name="txt_address" id="address" placeholder="enter address">
                            </label>
                        </div>

                        <div class="form-row">
                            <label>
                                <span>Phone No</span>
                                <input type="text" name="txt_phone" id="phonen" placeholder="enter phone no">
                            </label>
                        </div>

                        <div class="form-row">
                            <label>
                                <span>Email</span>
                                <input type="text" name="txt_email" id="email" placeholder="enter email">
                            </label>
                        </div>

                        <div class="form-row">
                            <label>
                                <span>Password</span>
                                <input type="password" name="txt_password" id="password" placeholder="enter password">
                            </label>
                        </div>
                        <input type="submit" name="btn_register" value="Register">
                    </div>
                    <a href="login.jsp" class="btn-acc form-log-in-with-existing btn-two">Already have an account? <b> Login here </b></a>
                </div>
            </form>
        </div>
    </body>
</html>
