<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentFeedback.aspx.cs" Inherits="Survey_Project.studentFeedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Feedback</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <meta name='viewport' content='width=device-width, initial-scale=1' />
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

    <style>
        .card {
            width: 70%;
            margin: 0 auto;
        }

        .elementor-element {
            background-color: #01696b;
            color: white;
            text-align: center;
        }

        .btn-primary {
            color: #00B3AB !important;
            border-color: #00B3AB !important;
            border-color: #00B3AB !important;
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
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <%--NavBar--%>

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

                    <asp:Button ID="Login" runat="server" Text="Log In" CssClass="btn btn-primary" OnClick="Login_Click" />

                    <asp:Button ID="Logout" runat="server" Text="Log Out" CssClass="btn btn-secondary" Style="display: none; background-color: #d85427" OnClick="Logout_Click" />
                </div>
            </div>
        </nav>

        <%--/////////////////////////////////////////////////////////////////--%>

        <div class="mx-0 mx-sm-auto">
            <div class="card">
                <div class="card-body">
                    <div class="text-center">
                        <asp:Image ID="Image1" runat="server" ImageUrl="home_image\file.png" AlternateText="My Image" CssClass="img-fluid" Style="width:100px; height:120px" />
                        <p>
                            <strong>Your opinion matters</strong>
                        </p>
                        <p>
                            Have some ideas how to improve our product?
                           
                            <strong>Give us your feedback.</strong>
                        </p>
                    </div>

                    <hr />

                    <asp:PlaceHolder ID="PanelContainer" runat="server"></asp:PlaceHolder>


                </div>
                <div class="card-footer text-end">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>

                    <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="SubmitButton_Click" Style="background-color: #d85427; color:white !important;" />

                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="elementor-element">
            <p style="font-weight: bold;">&copy; 2024 Logo. All rights reserved.</p>
            <br />
            <p style="float: inherit;"><a>Privacy Policy</a> &nbsp; | &nbsp; <a>Terms & Conditions</a></p>
        </footer>

    </form>
</body>
</html>
