<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Survey_Project.dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />

    <link rel="stylesheet" href="qoutestyle.css" />
    <link href="sb-admin-2.min.css" rel="stylesheet" />
    <link rel="icon" href="../images/spark-high-resolution-logo-transparent.png" type="image/x-icon" />

    <style>
        .btn-custom:focus {
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.5);
            outline: none;
        }

        .btn-primary {
            --bs-btn-bg: #00B3AB !important;
            --bs-btn-border-color: #00B3AB !important;
            --bs-btn-hover-border-color: #00B3AB !important;
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
    </style>

    <title>Dashboard</title>
</head>

<body id="page-top">
    <form id="form1" runat="server">

        <!-- Navbar start -->

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="background-color: #01696b !important;">
            <div class="container" style="margin: 0px; max-width:1800px;">
                <a class="navbar-brand" href="C:\Users\Orange\Desktop\Survey Project\Survey Project\home.aspx">
                    <img src="home_image\logo.png" style="width: 80px; height: 40px" />
                </a>

                <div class="collapse navbar-collapse" id="navbarNav" style="justify-content: flex-end;">
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

                    <asp:Button ID="Login" runat="server" Text="Log In" CssClass="btn btn-primary" OnClick="Login_Click" Style="--bs-btn-bg: #00B3AB !important; --bs-btn-border-color: #00B3AB !important; --bs-btn-hover-border-color: #00B3AB !important;" />

                    <asp:Button ID="Logout" runat="server" Text="Log Out" CssClass="btn btn-secondary" Style="display: none; background-color: #d85427" OnClick="Logout_Click" />
                </div>
            </div>
        </nav>
        <!-- Navbar End -->

        <div id="wrapper">

            <!-- start of sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar" style="background-color: #234652; background-image: linear-gradient(180deg, #234652 40%,#00B3AB 100%);">




                <li class="nav-item active">
                    <asp:LinkButton ID="dashboardLinkBtn" runat="server" PostBackUrl='~/dashboard.aspx' class="nav-link">
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
                    <div class="container-fluid">

                        <%--add page content here--%>

                        <section class="bg-light py-3 py-md-5">
                            <div class="container">
                                <div class="row justify-content-md-center">

                                    <div class="col-12 col-md-10 col-lg-8 col-xl-7 col-xxl-6">
                                        <section class="component1 fs-6 text-secondary mb-2 text-uppercase text-center ">
                                            <blockquote class="callout quote EN  ">
                                                The important thing is not your process.  
                                                The important thing is your process for improving your process.
                                            </blockquote>
                                        </section>
                                        <hr class="w-50 mx-auto mb-5 mb-xl-9 border-dark-subtle" />
                                    </div>

                                </div>
                            </div>

                            <div class="container">
                                <div class="row justify-content-md-center">

                                    <asp:LinkButton ID="newCoursesLinkBtn1" runat="server" class="col-xl-3 col-md-6 mb-4">
                                        <div class="card border-left-info shadow h-100 py-2" style="border-left: .25rem solid #FFF1D0 !important">
                                            <div class="card-body">
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col mr-2">
                                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                            Add new courses
                   
                                                        </div>
                                                    </div>
                                                    <div class="col-auto">
                                                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:LinkButton>

                                    <asp:LinkButton ID="showCoursesLinkBtn1" runat="server" class="col-xl-3 col-md-6 mb-4">
                                        <div class="card border-left-info shadow h-100 py-2" style="border-left: .25rem solid #FFF1D0 !important">
                                            <div class="card-body">
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col mr-2">
                                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                            Show current courses
                   
                                                        </div>
                                                    </div>
                                                    <div class="col-auto">
                                                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:LinkButton>

                                </div>
                            </div>

                            <div class="container">
                                <div class="row justify-content-md-center">

                                    <asp:LinkButton ID="newSurveyLinkBtn1" runat="server" class="col-xl-3 col-md-6 mb-4">
                                        <div class="card border-left-info shadow h-100 py-2" style="border-left: .25rem solid #FFF1D0 !important">
                                            <div class="card-body">
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col mr-2">
                                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                            Add survey
                   
                                                        </div>
                                                    </div>
                                                    <div class="col-auto">
                                                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:LinkButton>

                                    <asp:LinkButton ID="showSurveyLinkBtn1" runat="server" class="col-xl-3 col-md-6 mb-4">
                                        <div class="card border-left-info shadow h-100 py-2" style="border-left: .25rem solid #FFF1D0 !important">
                                            <div class="card-body">
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col mr-2">
                                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                            Show current survey
                   
                                                        </div>
                                                    </div>
                                                    <div class="col-auto">
                                                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:LinkButton>

                                    <asp:LinkButton ID="coursesResultsLinkBtn1" runat="server" class="col-xl-3 col-md-6 mb-4">
                                        <div class="card border-left-info shadow h-100 py-2" style="border-left: .25rem solid #FFF1D0 !important">
                                            <div class="card-body">
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col mr-2">
                                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                            Courses results
                   
                                                        </div>
                                                    </div>
                                                    <div class="col-auto">
                                                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:LinkButton>

                                </div>
                            </div>

                            <div class="container">
                                <div class="row justify-content-md-center">

                                    <asp:LinkButton ID="addStudentLinkBtn1" runat="server" class="col-xl-3 col-md-6 mb-4">
                                        <div class="card border-left-info shadow h-100 py-2" style="border-left: .25rem solid #FFF1D0 !important">
                                            <div class="card-body">
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col mr-2">
                                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                            Add new students
                   
                                                        </div>
                                                    </div>
                                                    <div class="col-auto">
                                                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:LinkButton>

                                    <asp:LinkButton ID="studentsListLinkBtn1" runat="server" class="col-xl-3 col-md-6 mb-4">
                                        <div class="card border-left-info shadow h-100 py-2" style="border-left: .25rem solid #FFF1D0 !important">
                                            <div class="card-body">
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col mr-2">
                                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                            Students list
                   
                                                        </div>
                                                    </div>
                                                    <div class="col-auto">
                                                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:LinkButton>

                                </div>
                            </div>

                        </section>
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
