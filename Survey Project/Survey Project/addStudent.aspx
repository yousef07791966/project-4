<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addStudent.aspx.cs" Inherits="Survey_Project.addStudent" %>

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
        /*body {
            background-color: #e9ecef;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #00B3AB;*/ /* Set default text color */
        /*}*/

        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 40px;
            border: none;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-control {
            border-radius: 30px;
            border-color: #00aaff;
        }

        .btn-primary {
            background-color: #00796b;
            border-color: #00aaff;
            border-radius: 30px;
            padding: 10px 20px;
        }

            .btn-primary:hover {
                background-color: #00B3AB;
                border-color: #007acc;
            }

        .form-check-label {
            margin-left: 20px;
            font-size: 14px;
            color: black; /* Set text color */
        }

        .form-check-input {
            margin-left: -1.5rem;
        }

        h2 {
            color: #00796b; /* Set text color */
            font-weight: 700;
        }

        label {
            font-weight: bold;
            color: #00796b;
            ; /* Set text color */
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
            <div class="container" style="margin: 0; max-width: 1600px">
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

                    <asp:Button ID="Logout" runat="server" Text="Log Out" CssClass="btn btn-secondary" Style="display: none; background-color: #d85427" OnClick="Logout_Click" />
                </div>
            </div>
        </nav>
        <!-- NaavBar -->


        <div id="wrapper">

            <!-- start of sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar" style="background-color: #234652; background-image: linear-gradient(180deg, #234652 40%,#00B3AB 100%);">


                <li class="nav-item active">
                    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl='~/dashboard.aspx' class="nav-link">
        <i class="fas fa-fw fa-tachometer-alt"></i>
        <span>Dashboard</span>
                    </asp:LinkButton>
                </li>

                <hr class="sidebar-divider">

                <li class="nav-item">
                    <a class="nav-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fa-solid fa-book"></i>
                        <span>Courses</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Courses:</h6>
                            <asp:LinkButton ID="newCoursesLinkBtn" runat="server" class="collapse-item" OnClick="newCoursesLinkBtn_Click">Add new course</asp:LinkButton>
                            <asp:LinkButton ID="showCoursesLinkBtn" runat="server" class="collapse-item" OnClick="showCoursesLinkBtn_Click">Show current courses</asp:LinkButton>
                        </div>
                    </div>
                </li>

                <li class="nav-item">
                    <a class="nav-link collapsed" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                        <i class="fa-solid fa-square-poll-vertical"></i>
                        <span>Surveys</span>
                    </a>
                    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Surveys:</h6>
                            <asp:LinkButton ID="newSurveyLinkBtn" runat="server" class="collapse-item" OnClick="newSurveyLinkBtn_Click">Add new survey</asp:LinkButton>
                            <asp:LinkButton ID="showSurveyLinkBtn" runat="server" class="collapse-item" OnClick="showSurveyLinkBtn_Click">Show current surveys</asp:LinkButton>
                            <asp:LinkButton ID="coursesResultsLinkBtn" runat="server" class="collapse-item" OnClick="coursesResultsLinkBtn_Click">Courses results</asp:LinkButton>
                        </div>
                    </div>
                </li>

                <li class="nav-item">
                    <a class="nav-link collapsed" data-toggle="collapse" data-target="#collapseST" aria-expanded="true" aria-controls="collapseST">
                        <i class="fa-solid fa-users"></i>
                        <span>Students</span>
                    </a>
                    <div id="collapseST" class="collapse" aria-labelledby="headingST" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Students:</h6>
                            <asp:LinkButton ID="addStudentLinkBtn" runat="server" class="collapse-item" OnClick="addStudentLinkBtn_Click">Add new students</asp:LinkButton>
                            <asp:LinkButton ID="studentsListLinkBtn" runat="server" class="collapse-item" OnClick="studentsListLinkBtn_Click">Students list</asp:LinkButton>
                        </div>
                    </div>
                </li>
            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">

                    <!-- Navbar start -->

                    <!-- Navbar End -->

                    <div class="container-fluid">

                        <%--add page content here--%>

                        <div class="container">
                            <div class="row">
                                <div class="col-md-6 form-container">
                                    <h2 class="text-center mb-4">Add Student</h2>
                                    <div id="form2" runat="server">
                                        <div class="form-group">
                                            <label for="txtId">ID:</label>
                                            <asp:TextBox ID="txtId" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtName">Name:</label>
                                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtEmail">Email:</label>
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Courses:</label>
                                            <div class="form-check">
                                                <asp:CheckBox ID="chkCourse1" runat="server" CssClass="form-check-input" />
                                                <label class="form-check-label" for="chkCourse1">NodeJS</label>
                                            </div>
                                            <div class="form-check">
                                                <asp:CheckBox ID="chkCourse2" runat="server" CssClass="form-check-input" />
                                                <label class="form-check-label" for="chkCourse2">CSharp</label>
                                            </div>
                                            <div class="form-check">
                                                <asp:CheckBox ID="chkCourse3" runat="server" CssClass="form-check-input" />
                                                <label class="form-check-label" for="chkCourse3">Front-end Development</label>
                                            </div>
                                            <div class="form-check">
                                                <asp:CheckBox ID="chkCourse4" runat="server" CssClass="form-check-input" />
                                                <label class="form-check-label" for="chkCourse4">PHP</label>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click1" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--end of page content--%>
                    </div>

                    <footer class="elementor-element">
                        <p style="font-weight: bold;">&copy; 2024 Logo. All rights reserved.</p>
                        <br>
                        <p style="float: inherit;"><a>Privacy Policy</a> &nbsp; | &nbsp; <a>Terms & Conditions</a></p>
                    </footer>

                </div>
            </div>
            <!-- End of Content Wrapper -->
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="jquery.min.js"></script>
        <script src="bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>
