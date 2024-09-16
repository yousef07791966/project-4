<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="showDetails.aspx.cs" Inherits="Survey_Project.showDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
    <link href="sb-admin-2.min.css" rel="stylesheet" />
    <link rel="icon" href="../images/spark-high-resolution-logo-transparent (1).png" type="image/x-icon" />

    <style>
        .form-group {
            margin-bottom: 50px;
        }

        .center-container {
            height: 80vh;
            display: flex;
            align-items: center;
            align-content: center;
            flex-direction: column;
            flex-wrap: wrap;
            justify-content: center;
        }

        .form-group label {
            font-size: 1.2em;
            font-weight: bold;
            color: #01696b; /* Use the color from the footer */
        }

        .form-group .aspLabel {
            font-size: 1.2em;
            color: #01696b; /* Use the color from the footer */
        }

        .form-group .aspDropDownList {
            width: 300px;
            padding: 10px;
            border: 1px solid #01696b;
            border-radius: 5px;
            color: #01696b;
        }

        footer {
            padding: 20px 0;
            text-align: center;
            background-color: #01696b;
            border-top: 1px solid #dee2e6;
            margin-top: 30px;
            color: white;
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

        footer {
            padding: 20px 0;
            text-align: center;
            background-color: #01696b;
            border-top: 1px solid #dee2e6;
            margin-top: 30px;
            color: white;
        }

        .navbar-expand-lg .navbar-collapse {
            display: flex !important;
            flex-basis: auto;
            justify-content: flex-end;
        }

        .navbar {
            justify-content: space-between !important;
        }
    </style>

    <title>Add student</title>
</head>

<body id="page-top">
    <form id="form1" runat="server">
        <!-- NaavBar -->
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

                    <asp:Button ID="Logout" runat="server" Text="Log Out" CssClass="btn btn-secondary" Style="display: none;" OnClick="Logout_Click" />
                </div>
            </div>
        </nav>
        <!-- NaavBar -->


        <div id="wrapper">
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <div class="container-fluid">
                        <!-- Page content here -->
                        <div class="center-container">
                            <div class="form-group">
                                <label for="studentName">Student Name:</label>
                                <asp:Label ID="lblStudentName" runat="server" Text="" CssClass="aspLabel"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label for="studentId">Student ID:</label>
                                <asp:Label ID="lblStudentId" runat="server" Text="" CssClass="aspLabel"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label for="courseName">Course Name:</label>
                                <asp:DropDownList ID="ddlCourseName" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCourseName_SelectedIndexChanged" CssClass="aspDropDownList">
                                </asp:DropDownList>
                            </div>
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="QuestionNumber" HeaderText="Question number" />
                                    <asp:BoundField DataField="Question" HeaderText="Question" />
                                    <asp:BoundField DataField="Answer" HeaderText="Answer" />
                                </Columns>
                            </asp:GridView>
                            <asp:Label runat="server" ID="q1" CssClass="aspLabel"></asp:Label><br />
                            <asp:Label runat="server" ID="q2" CssClass="aspLabel"></asp:Label>
                        </div>
                        <!-- End of page content -->
                    </div>
                </div>
            </div>
        </div>

        <footer class="elementor-element">
            <p style="font-weight: bold;">&copy; 2024 Logo. All rights reserved.</p>
            <br>
            <p style="float: inherit;"><a>Privacy Policy</a> &nbsp; | &nbsp; <a>Terms & Conditions</a></p>
        </footer>


        <!-- End of Content Wrapper -->


        <!-- Bootstrap core JavaScript-->
        <script src="jquery.min.js"></script>
        <script src="bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>
