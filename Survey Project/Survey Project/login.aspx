<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Survey_Project.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="icon" href="../images/spark-high-resolution-logo-transparent (1).png" type="image/x-icon" />
    <style>
        body {
            background-color: hsl(0, 0%, 96%);
        }

        .container-fluid {
            background-color: white;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .card {
            border-radius: 15px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 500px;
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
            padding: 20px 0;
            text-align: center;
            background-color: #01696b;
            border-top: 1px solid #dee2e6;
            margin-top: 30px;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Navbar start -->
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
                                <asp:HyperLink ID="Courses" runat="server" NavigateUrl="~/courses.aspx" CssClass="nav-link" Style="display: none;">Courses</asp:HyperLink>
                            </li>
                        </ul>

                        <asp:Button ID="Login" runat="server" Text="Log In" CssClass="btn btn-primary" />

                        <asp:Button ID="Logout" runat="server" Text="Log Out" CssClass="btn btn-secondary" Style="display: none;" OnClick="Logout_Click" />
                    </div>
                </div>
            </nav>

            <!-- Navbar End -->

            <!-- Section: Design Block -->
            <section class="">
                <div class="px-4 py-5 px-md-5 text-center text-lg-start">
                    <div class="container">
                        <div class="d-flex justify-content-center">
                            <div class="row gx-lg-5 align-items-center">
                                <div class="col-lg-6 mb-5 mb-lg-0">
                                    <div class="card">
                                        <div class="card-body py-5 px-md-5">
                                            <div>
                                                <h1 class="form-header_header__UhqWw" style="text-align: center;">Sign in to your account.</h1>
                                                <p class="form-header_description__2ic93" style="text-align: center;">
                                                    <span>Build skills for today, tomorrow, and beyond.<br>
                                                        Education to future-proof your career.</span>
                                                </p>
                                            </div>
                                            <div class="or-separator_contain__3YaFK" style="text-align: center;">
                                                _____________________________________________________
                                            </div>
                                            <br />

                                            <div class="mb-3">
                                                <label for="newUsername" class="form-label">Username</label>
                                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                                                <span id="newUsernameError" runat="server" style="color: red;"></span>
                                            </div>
                                            <div class="mb-3">
                                                <label for="newID" class="form-label">ID</label>
                                                <asp:TextBox ID="txtID" runat="server" CssClass="form-control"></asp:TextBox>
                                                <span id="newIDError" runat="server" style="color: red;"></span>
                                            </div>
                                            <div class="text-center">
                                                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn btn-primary" />
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!-- Content column div -->
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Footer -->
            <footer class="elementor-element">
                <p style="font-weight: bold;">&copy; 2024 Logo. All rights reserved.</p>
                <br />
                <p style="float: inherit;"><a>Privacy Policy</a> &nbsp; | &nbsp; <a>Terms & Conditions</a></p>
            </footer>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        </div>
    </form>
</body>
</html>
