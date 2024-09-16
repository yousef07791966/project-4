<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Survey_Project.home" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spark academy</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" href="images/spark-high-resolution-logo-transparent (1).png" type="image/x-icon"/>
    <style>
        body {
            background-color: white;
        }

        .navbar {
            background-color: #d85427
        }

        .navbar-brand {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .hero-section {
            padding: 100px 0;
            color: white;
        }

        .search-bar input {
            width: 50%;
            margin: 20px auto;
        }

        .elementor-heading-title {
            color: #d3551e;
            font-weight: bold;
        }
        /*feasure */
        .features-section {
            background-color: #242936; /* Set your desired background color */
            position: relative; /* Needed for positioning animation elements */
        }

        .background-animation {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none; /* Prevent clicks on animation elements */
        }

            .background-animation span {
                display: block;
                width: 20px;
                height: 20px;
                border-radius: 50%;
                background-color: #fff;
                opacity: 0.2;
                position: absolute;
                animation-name: move;
                animation-duration: 5s;
                animation-iteration-count: infinite;
                animation-timing-function: ease-in-out;
            }

                .background-animation span:nth-child(1) {
                    animation-delay: 0s;
                    left: 10%;
                    top: 20%;
                }

                .background-animation span:nth-child(2) {
                    animation-delay: 1s;
                    left: 80%;
                    top: 30%;
                }

                .background-animation span:nth-child(3) {
                    animation-delay: 2s;
                    left: 20%;
                    top: 70%;
                }

                .background-animation span:nth-child(4) {
                    animation-delay: 3s;
                    left: 70%;
                    top: 80%;
                }

                .background-animation span:nth-child(5) {
                    animation-delay: 4s;
                    left: 50%;
                    top: 50%;
                }

        @keyframes move {
            from {
                transform: translate(-50%, -50%) scale(0.5);
            }

            to {
                transform: translate(-50%, -50%) scale(1);
                opacity: 0.8;
            }
        }

        /*end*/

        .elementor-element {
            background-color: #01696b;
            color: white;
            text-align: center;
        }

        .bg-dark {
            --bs-bg-opacity: 1;
            background-color: #d85427 !important;
        }

        /*Testimonal */
        .testimonials {
            padding: 60px 0;
        }

            .testimonials h2 {
                font-size: 2.5rem;
                margin-bottom: 40px;
            }

        .testimonial-item {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

            .testimonial-item h5 {
                font-weight: bold;
            }

            .testimonial-item p {
                font-size: 1rem;
            }

            .testimonial-item .quote-icon {
                font-size: 2rem;
                color: #007bff;
            }

            .testimonial-item .rating {
                color: #ffc107;
            }
        /*end*/
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
    </style>
</head>

<body>
    <form id="form1" runat="server">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="background-color: #01696b !important;">
    <div class="container">
        <a class="navbar-brand" href="C:\Users\Orange\Desktop\Survey Project\Survey Project\home.aspx" >
            <img src="home_image\logo.png" style="width: 80px; height:40px"/>
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
                    <asp:HyperLink ID="Courses" runat="server" NavigateUrl="~/studentsCourses.aspx" CssClass="nav-link" Style="display: none; background-color:#00B3AB; ">Courses</asp:HyperLink>
                </li>
            </ul>

            <asp:Button ID="Login" runat="server" Text="Log In" CssClass="btn btn-primary" OnClick="Login_Click"/>

            <asp:Button ID="Logout" runat="server" Text="Log Out" CssClass="btn btn-secondary" Style="display: none; background-color: #d85427" OnClick="Logout_Click" />
        </div>
    </div>
</nav>


    <!-- Hero Section -->
    <div class="hero-section text-center" style="background-color: whitesmoke;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6 text-left">
                    <h1 class="display-4" style="color: #234652; font-weight: bold;">Learn creative skills</h1>
                    <p style="color: black;">Explore thousands of tutorials, tips and tricks from leading industry experts. Totally free.</p>
                    <div class="text-center mt-4">
          <a href="login.aspx" class="btn btn-primary" style="background-color:#00b3ab;">Get Started</a>
                    </div>
                </div>
                <div class="col-md-6">
                    <img src="home_image\pexels-divinetechygirl-1181298.jpg" class="img-fluid" alt="Hero Image">
                </div>
            </div>
        </div>
    </div>

    <br>
    <br>

    <!-- Courses Section -->
    <div class="container my-5">
        <h2 class="text-center mb-5" style="color: #01696b; font-weight: bold;">Choose Our Quality Course</h2>
        <div class="row">
            <!-- Add Course Cards Here -->
            <div class="col-md-4" style="display: flex; align-items: stretch;">
                <div class="card mb-4">
                    <img src="home_image\csharp.jpg" class="card-img-top" alt="Course Image" style="height: 12em;">
                    <div class="card-body" style="display: flex; flex-direction: column; justify-content: space-between;">
                        <h5 class="card-title" style="color: #09A098;">C#</h5>
                        <p>Master object-oriented programming with C# and leverage the power of ASP.NET to create dynamic and interactive web applications.</p>
                        <p class="card-text" style="font-weight:bold">10 Chapters</p>
                        <a href="#" class="btn btn-primary" style="background-color: #d3551e; border-color: #d3551e; color: azure;">Start Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4" style="display: flex; align-items: stretch;">
                <div class="card mb-4">
                    <img src="home_image\PHP.jpg" class="card-img-top" alt="Course Image" style="height: 12em;">
                    <div class="card-body" style="display: flex; flex-direction: column; justify-content: space-between;">
                        <h5 class="card-title" style="color: #09A098;">PHP</h5>
                        <p>Learn server-side scripting with PHP and explore frameworks to streamline building dynamic websites.</p>
                        <p class="card-text" style="font-weight:bold">8 Chapters</p>
                        <a href="#" class="btn btn-primary" style="background-color: #d3551e; border-color: #d3551e;">Start Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4" style="display: flex; align-items: stretch;">
                <div class="card mb-4">
                    <img src="home_image\webdev.jpg" class="card-img-top" alt="Course Image" style="height: 12em;">
                    <div class="card-body" style="display: flex; flex-direction: column; justify-content: space-between;">
                        <h5 class="card-title" style="color: #09A098;">Front-End Development</h5>
                        <p>Whether you're new to web development or looking to expand your knowledge, master the core technologies of HTML, CSS, and JavaScript. Build responsive websites that adapt to any device and explore the back-end technologies that power the web.</p>
                        <p class="card-text" style="font-weight:bold">20 Chapters</p>
                        <a href="#" class="btn btn-primary" style="background-color: #d3551e; border-color: #d3551e;">Start Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <br>
    <br>

    <!-- Testimonials Section -->
    <div class="testimonials text-center">
        <div class="container">
            <h2 style="color:#09a098">What the community is saying</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="testimonial-item">
                        <span class="speech-icon">💬</span>
                        <h5 style="color:#01696b">Wow, this website is a lifesaver! </h5>
                        <p>
                            I work full-time and barely have any free time, but I've always wanted to learn more about coding. I recently finished the 'Intro to HTML and CSS' course and I can't believe how much I learned in just a few hours. Now I can finally customize my personal website!                       
                        </p>
                        <div class="rating">
                            ★★★★★
                       
                        </div>
                        <p class="text-muted">— Bilal S</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="testimonial-item">
                        <span class="speech-icon">💬</span>
                        <h5 style="color:#01696b">Easy to use</h5>
                        <p>
                            Level up my skills? Done! [Website Name]'s advanced web development course helped me land a new job as a junior developer.                       

                        </p>
                        <div class="rating">
                            ★★★★★
                       
                        </div>
                        <p class="text-muted">- Razan</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="testimonial-item">
                        <span class="speech-icon">💬</span>
                        <h5 style="color:#01696b">New Path in my life</h5>
                        <p>
                            After I retired, I realized I had all this free time and I wanted to keep my mind active. They have such a wide variety of courses on all sorts of topics. Keep Going !

                        </p>
                        <div class="rating">
                            ★★★★★
                       
                        </div>
                        <p class="text-muted">— Ali Pre-Marketing</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <br>
    <br>

    <!-- Features Section -->
<div class="features-section text-center text-white d-flex align-items-center justify-content-center">
  <div class="container">
      <br>
    <h2 class="animated fadeInDown delay-1s">Learn anything, anytime, anywhere...</h2>
    <p>
      <span class="d-flex flex-wrap justify-content-center">
        <span class="feature-card mx-3">
          <i class="fas fa-user-graduate"></i> Certified Instructors
        </span>
        <span class="feature-card mx-3">
          <i class="fas fa-check-circle"></i>  Easy Registration
        </span>
        <span class="feature-card mx-3">
          <i class="fas fa-credit-card"></i>  Simple Payment Methods
        </span>
        <span class="feature-card mx-3">
          <i class="fas fa-globe"></i>  Access Anywhere 24/7
        </span>
      </span>
    </p>
  </div>

  <div class="background-animation">
    
  </div>
</div>

    <br>
    <br>


    <!-- About Us Section -->
    <div class="container my-5">
        <div class="row">
            <div class="col-md-6">
                <img src="home_image\pexels-thisisengineering-3861972.jpg" class="img-fluid" alt="About Us Image">
            </div>
            <div class="col-md-6">
                <br><br>
                <h6 style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif"; > - About Us</h6>
                <h2 class="elementor-heading-title">We offer you a brighter future. <br> Start now!</h2>
                <p style="font-size:small">Financial modeling is an essential skill for professionals in finance,<br> investment banking, corporate development, and many other fields. To help you build and refine this skill, <br>there are numerous courses available that cater to different levels of expertise and areas of interest.</p>
            </div>
        </div>
    </div>


    <!-- Footer -->
    <footer class="elementor-element">
        <p style="font-weight: bold;">&copy; 2024 Logo. All rights reserved.</p> <br>
        <p style="float: inherit;"> <a>Privacy Policy</a> &nbsp; | &nbsp; <a>Terms & Conditions</a></p>
    </footer>

 </form>
</body>
</html>

