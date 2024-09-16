<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contactus.aspx.cs" Inherits="Survey_Project.contactus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<head runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha384-oBGFcfkPwKoaCkVgtAfn1Mv5RI1F2sFxr0x7lHzr4g9jv4I6dRJZExj/7zrXBLh4" crossorigin="anonymous">

    <style>
        body {
            background-color: #FAFFFE;
        }

        .navbar {
            overflow: hidden;
            background-color: #333;
            position: fixed;
            top: 0;
            width: 100%;
        }

            .navbar a {
                float: left;
                display: block;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

                /*.navbar a:hover {
                    background-color: #ddd;
                    color: black;
                }*/

        #contactContainer {
            background-color: #FAFFFE;
            color: #410d41;
            display: flex;
            justify-content: space-evenly;
            align-items: center;
            padding: 30px;
            box-shadow: 0 -5px 5px rgb(185, 185, 185);
            height: 80vh;
        }

        .contact-form {
            background-color: #FFF9EC;
            border-radius: 15px;
            color: #410d41;
            display: flex;
            padding: 25px;
            width: 50%;
            display: flex;
            justify-content: center;
            text-align: center;
            flex-direction: column;
        }

            .contact-form input, .contact-form textarea {
                width: 100%;
                padding: 10px;
                margin: 5px 0;
                border-radius: 5px;
                border: 1px solid #ccc;
            }

            .contact-form button {
                background-color: #28a745;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

        #btnSendInquiry {
            background-color: #00B3AB !important
        }

        .contact-icons {
            text-align: center;
            margin: 20px 0;
            margin: 15px;
            width: 50%;
            color: #234652;
        }

            .contact-icons a {
                margin: 15px;
                width: 15%;
                color: #00B3AB
            }

                .contact-icons a i {
                    font-size: 1.25em;
                }

        .btn-primary {
            --bs-btn-bg: #00B3AB;
            --bs-btn-border-color: #00B3AB;
            --bs-btn-hover-border-color: #00B3AB;
        }

        .btn-custom:focus {
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.5);
            outline: none;
        }

        .btn-primary {
            --bs-btn-bg: #00B3AB;
            --bs-btn-border-color: #00B3AB;
            --bs-btn-hover-border-color: #00B3AB;
        }

            .btn-primary:hover {
                background-color: #d85427 !important;
            }

        .text-primary {
            --bs-text-opacity: 1;
            color: #d85427 !important;
        }

        footer {
            background-color: #f8f9fa;
            padding: 20px 0;
        }

        .footer {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            background-color: #333;
            color: #f2f2f2;
            text-align: center;
            padding: 10px 0;
            background-color: #01696b !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="background-color: #01696b !important;">
            <div class="container">
                <a class="navbar-brand" href="C:\Users\Orange\Desktop\Survey Project\Survey Project\home.aspx">
                    <img src="home_image\logo.png" style="width: 80px; height: 40px" />
                </a>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto" id="NavLinks" runat="server">
                        <li class="nav-item">
                            <asp:HyperLink runat="server" NavigateUrl="~/home.aspx" CssClass="nav-link">Home</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink runat="server" NavigateUrl="~/aboutus.aspx" CssClass="nav-link">About us</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink runat="server" NavigateUrl="~/contactus.aspx" CssClass="nav-link">Contact us</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="Dashboard" runat="server" NavigateUrl="~/dashboard.aspx" CssClass="nav-link" Style="display: none;">Dashboard</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="Courses" runat="server" NavigateUrl="~/studentsCourses.aspx" CssClass="nav-link" Style="display: none;">Courses</asp:HyperLink>
                        </li>
                    </ul>

                    <asp:Button ID="Login" runat="server" Text="Log In" CssClass="btn btn-primary" OnClick="Login_Click" />

                    <asp:Button ID="Logout" runat="server" Text="Log Out" CssClass="btn btn-secondary" Style="display: none;background-color: #d85427" OnClick="Logout_Click" />
                </div>
            </div>
        </nav>


        <div id="contactContainer">

            <!--content-->
            <div class="contact-form">
                <asp:TextBox ID="txtName" runat="server" Placeholder="Your Name"></asp:TextBox>
                <asp:TextBox ID="txtEmail" runat="server" Placeholder="Email Address" TextMode="Email"></asp:TextBox>
                <asp:TextBox ID="txtSubject" runat="server" Placeholder="Subject"></asp:TextBox>
                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Placeholder="Message"></asp:TextBox>
                <asp:Button ID="btnSendInquiry" runat="server" Text="Send Inquiry" Style="background-color: #d85427;" />
            </div>
            <!-- Contact Icons -->
            <div class="contact-icons">
                <h2>Let's Get in Contact</h2>
                <a href="mailto:your_email@example.com" target="_blank"><i class="fas fa-envelope"></i></a>
                <a href="tel:+1234567890" target="_blank"><i class="fas fa-phone"></i></a>
                <a href="https://wa.me/1234567890" target="_blank"><i class="fab fa-whatsapp"></i></a>
                <a href="https://github.com/yourprofile" target="_blank"><i class="fab fa-github"></i></a>
                <a href="https://linkedin.com/in/yourprofile" target="_blank"><i class="fab fa-linkedin"></i></a>
            </div>
        </div>

        <!--Footer-->
        <div class="footer">
            <p>Â© 2024 Your Company. All rights reserved.</p>
            <p><a>Privacy Policy</a> &nbsp; | &nbsp; <a>Terms & Conditions</a></p>
        </div>
    </form>

</body>
</html>

