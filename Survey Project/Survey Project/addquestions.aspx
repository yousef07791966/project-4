<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addquestions.aspx.cs" Inherits="Survey_Project.addquestions" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Questions</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />

    <link rel="stylesheet" href="qoutestyle.css" />
    <link href="sb-admin-2.min.css" rel="stylesheet" />
    <link rel="icon" href="../images/spark-high-resolution-logo-transparent.png" type="image/x-icon" />

    <style>
        body {
            background-color: #FAFFFE;
            color: #000000;
            font-family: Arial, sans-serif;
        }

        .main-header, .main-footer {
            background-color: #234652;
            color: #FFFFFF;
            padding: 10px;
            text-align: center;
        }

        .card {
            background-color: #00B3AB;
            color: #FFFFFF;
        }

        .btn-custom {
            background-color: #d85427;
            color: #FFFFFF;
            border: none;
        }

            .btn-custom:hover {
                background-color: #FFF1D0;
                color: #000000;
            }

        .form-control-custom {
            background-color: #FFFFFF;
            color: #000000;
        }

        .card-header, .card-body {
            background-color: #00B3AB;
            color: #FFFFFF;
        }

        .form-check-label {
            font-size: 1.2em;
        }

        .form-check-input {
            margin-right: 10px;
        }

        .form-group label, .form-group input, .form-group select {
            color: #000000;
        }

        footer {
            padding: 20px 0;
            text-align: center;
            background-color: #01696b;
            border-top: 1px solid #dee2e6;
            /*margin-top: 30px;*/
            color: white;
        }

        #side {
            display: grid;
            grid-template-columns: 1fr 8fr;
        }

        #questions {
            margin: 20px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var questions = {
                "c#": [
                    "How would you rate your experience with C#?",
                    "How often do you use C#?",
                    "How familiar are you with LINQ in C#?",
                    "How comfortable are you with asynchronous programming in C#?",
                    "How would you rate your understanding of C# collections?",
                    "How often do you use C# for web development?",
                    "How familiar are you with C# exception handling?",
                    "How comfortable are you with object-oriented programming in C#?",
                    "How would you rate your understanding of C# generics?",
                    "How often do you use C# for desktop application development?"
                ],
                "php": [
                    "How would you rate your experience with PHP?",
                    "How often do you use PHP?",
                    "How familiar are you with PHP frameworks like Laravel?",
                    "How comfortable are you with PHP error handling?",
                    "How would you rate your understanding of PHP arrays?",
                    "How often do you use PHP for web development?",
                    "How familiar are you with PHP sessions and cookies?",
                    "How comfortable are you with object-oriented programming in PHP?",
                    "How would you rate your understanding of PHP file handling?",
                    "How often do you use PHP for backend development?"
                ],
                "nodejs": [
                    "How would you rate your experience with Node.js?",
                    "How often do you use Node.js?",
                    "How familiar are you with Node.js frameworks like Express?",
                    "How comfortable are you with Node.js error handling?",
                    "How would you rate your understanding of Node.js modules?",
                    "How often do you use Node.js for web development?",
                    "How familiar are you with asynchronous programming in Node.js?",
                    "How comfortable are you with event-driven programming in Node.js?",
                    "How would you rate your understanding of Node.js streams?",
                    "How often do you use Node.js for backend development?"
                ],
                "frontend": [
                    "How would you rate your experience with front-end development?",
                    "How often do you use front-end technologies?",
                    "How familiar are you with HTML5 and CSS3?",
                    "How comfortable are you with JavaScript frameworks like React or Angular?",
                    "How would you rate your understanding of responsive design?",
                    "How often do you use front-end build tools like Webpack or Gulp?",
                    "How familiar are you with front-end testing frameworks?",
                    "How comfortable are you with CSS preprocessors like SASS or LESS?",
                    "How would you rate your understanding of front-end performance optimization?",
                    "How often do you use version control systems in front-end development?"
                ]
            };

            $("#technologyDropdown").change(function () {
                var selectedTech = $(this).val();
                var questionList = questions[selectedTech];
                $("#questionsDiv").empty();

                if (questionList) {
                    for (var i = 0; i < questionList.length; i++) {
                        $("#questionsDiv").append('<div class="form-check"><input class="form-check-input" type="checkbox" name="questions" value="' + questionList[i] + '"/><label class="form-check-label">' + questionList[i] + '</label></div>');
                    }
                }
            });

            $("#addQuestionBtn").click(function () {
                var newQuestion = $("#newQuestion").val();
                if (newQuestion.trim() !== "") {
                    $("#questionsDiv").append('<div class="form-check"><input class="form-check-input" type="checkbox" name="questions" value="' + newQuestion + '"/><label class="form-check-label">' + newQuestion + '</label></div>');
                    $("#newQuestion").val('');
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <%-- Navbar --%>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="background-color: #01696b !important;">
            <div class="container" style="margin: 0px; max-width: 1800px;">
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
                            <asp:HyperLink ID="Courses" runat="server" NavigateUrl="~/studentsCourses.aspx" CssClass="nav-link" Style="display: none; background-color: #00B3AB;">Courses</asp:HyperLink>
                        </li>
                    </ul>

                    <asp:Button ID="Login" runat="server" Text="Log In" CssClass="btn btn-primary" OnClick="Login_Click" />

                    <asp:Button ID="Logout" runat="server" Text="Log Out" CssClass="btn btn-secondary" Style="display: none; background-color: #d85427" OnClick="Logout_Click" />
                </div>
            </div>
        </nav>

        <%-- Main Content --%>
        <div class="main-header">
            <h2>Add Questions</h2>
        </div>

        <div id="side">
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

            <%--main contant--%>
            <div id="questions">
                <div class="card mt-4" style="border: 1px solid white; border-radius: 5px;">
                    <div class="card-header">
                        <h4>Select Technology</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="technologyDropdown">Choose Technology:</label>
                            <select class="form-control form-control-custom" id="technologyDropdown">
                                <option value="c#">C#</option>
                                <option value="php">PHP</option>
                                <option value="nodejs">Node.js</option>
                                <option value="frontend">Front-end</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="card mt-4">
                    <div class="card-header">
                        <h4>Questions</h4>
                    </div>
                    <div class="card-body" id="questionsDiv">
                        <!-- Questions will be added here dynamically -->
                    </div>
                </div>

                <div class="card mt-4">
                    <div class="card-header">
                        <h4>Add New Question</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <input type="text" class="form-control form-control-custom" id="newQuestion" placeholder="Enter new question" />
                        </div>
                        <button type="button" class="btn btn-custom mt-2" id="addQuestionBtn">Add New Question</button><br />
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-custom btn-secondary mt-2" Text="Submit" OnClick="SubmitBtn_Click" />
                    </div>
                </div>
            </div>
        </div>


        <%-- Footer --%>
        <footer class="elementor-element">
            <p style="font-weight: bold;">&copy; 2024 Logo. All rights reserved.</p>
            <br>
            <p style="float: inherit;"><a>Privacy Policy</a> &nbsp; | &nbsp; <a>Terms & Conditions</a></p>
        </footer>
    </form>
</body>
</html>
