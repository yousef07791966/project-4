<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="surveyresult.aspx.cs" Inherits="Survey_Project.surveyresult" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="sb-admin-2.min.css" rel="stylesheet" />
    <link rel="icon" href="../images/spark-high-resolution-logo-transparent (1).png" type="image/x-icon" />

    <style>
        /*body {
            font-family: Arial, sans-serif;
            background-color: #fafffe;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 800px;
        }*/

        .container {
            text-align: justify;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #234652;
        }

        p, select, .result, #lblPercentage {
            color: #000000;
        }

        .result {
            background-color: #00b3ab;
        }

        .overview select {
            background-color: #fff1d0;
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 5px;
            margin-top: 10px;
        }

        .results {
            display: flex;
            justify-content: space-around;
            align-items: center;
            margin-top: 20px;
        }

        .result {
            width: 150px;
            height: 150px;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 50%;
            color: #fff;
            font-size: 24px;
        }

        .overview {
            display: flex;
            flex-direction: column;
        }

        select {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-top: 10px;
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

        .collapse {
            justify-content: flex-end !important;
        }

        .container {
            color: white !important;
            background-color: #01696b !important;
        }

        #result3 {
            background-color: #fff !important;
            width: 1000px;
            margin: 80px auto;
            border: solid black 1px;
            border-radius: 10px;
            padding: 15px;
            height: 400px;
        }

        footer {
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


    <title>Add student</title>
</head>

<body id="page-top">
    <form id="form1" runat="server">
        <!-- Navbar start -->

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="background-color: #01696b !important;">
            <div class="container" style="max-width: 1800px; height: 60px">
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

        <!-- Navbar End -->


        <div id="wrapper">

            <!-- start of sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar" style="background-color: #234652; background-image: linear-gradient(180deg, #234652 40%,#00B3AB 100%);">
                <hr class="sidebar-divider my-0">

                <li class="nav-item active">
                    <asp:LinkButton ID="dashboardLinkBtn" runat="server" PostBackUrl='#' class="nav-link">
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
                            <asp:LinkButton ID="newCoursesLinkBtn" runat="server" class="collapse-item">Add new course</asp:LinkButton>
                            <asp:LinkButton ID="showCoursesLinkBtn" runat="server" class="collapse-item">Show current courses</asp:LinkButton>
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
                            <asp:LinkButton ID="newSurveyLinkBtn" runat="server" class="collapse-item">Add new survey</asp:LinkButton>
                            <asp:LinkButton ID="showSurveyLinkBtn" runat="server" class="collapse-item">Show current surveys</asp:LinkButton>
                            <asp:LinkButton ID="coursesResultsLinkBtn" runat="server" class="collapse-item">Courses results</asp:LinkButton>
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
                            <asp:LinkButton ID="addStudentLinkBtn" runat="server" class="collapse-item">Add new students</asp:LinkButton>
                            <asp:LinkButton ID="studentsListLinkBtn" runat="server" class="collapse-item">Students list</asp:LinkButton>
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

                        <div id="result3">
                            <h1>Course Results</h1>
                            <p>"Discover the impact of our training programs through comprehensive feedback insights. Our detailed analysis highlights how participants perceive each course, enabling us to continuously elevate the quality and effectiveness of our offerings. </p>
                            <div class="results">
                                <div id="result" class="result" runat="server">
                                    <asp:Label ID="lblPercentage" runat="server" Text="0"></asp:Label>
                                    of 100
        
                                </div>
                                <div class="overview">
                                    <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                                        <asp:ListItem Text="Select Category" Value=""></asp:ListItem>
                                        <asp:ListItem Text="C#" Value="csharp"></asp:ListItem>
                                        <asp:ListItem Text="PHP" Value="php"></asp:ListItem>
                                        <asp:ListItem Text="Node.js" Value="nodejs"></asp:ListItem>
                                        <asp:ListItem Text="Front-end development" Value="frontend"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <%--end of page content--%>
                    </div>

                </div>


            </div>
            <!-- End of Content Wrapper -->
            <footer class="elementor-element">
                <p style="font-weight: bold;">&copy; 2024 Logo. All rights reserved.</p>
                <br>
                <p style="float: inherit;"><a>Privacy Policy</a> &nbsp; | &nbsp; <a>Terms & Conditions</a></p>
            </footer>
        </div>



        <!-- Bootstrap core JavaScript-->
        <script src="jquery.min.js"></script>
        <script src="bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>
