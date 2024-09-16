<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aboutus.aspx.cs" Inherits="Survey_Project.aboutus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <title>About US</title>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="aboutUs.css" />
    <link rel="icon" href="../images/spark-high-resolution-logo-transparent (1).png" type="image/x-icon" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
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
                                <asp:HyperLink ID="Dashboard" runat="server" NavigateUrl="~/dashboard.aspx" CssClass="nav-link" Style="display: none; ">Dashboard</asp:HyperLink>
                            </li>
                            <li class="nav-item">
                                <asp:HyperLink ID="Courses" runat="server" NavigateUrl="~/studentsCourses.aspx" CssClass="nav-link" Style="display: none;">Courses</asp:HyperLink>
                            </li>
                        </ul>

                        <asp:Button ID="Login" runat="server" Text="Log In" CssClass="btn btn-primary" OnClick="Login_Click" Style="width: 80px; background-color:#00B3AB" />

                        <asp:Button ID="Logout" runat="server" Text="Log Out" CssClass="btn btn-secondary" OnClick="Logout_Click" Style="width: 85px; display: none; background-color: #d85427" />
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->

            <section id="home">
                <div class="home-left">
                    <img src="home_image\pexels-olia-danilevich-4974915.jpg" alt="">
                </div>
                <div class="home-right">
                    <h2 class="home-heading">At our academy </h2>
                    <p class="home-para">
                        Welcome to <span style="color: #00B3AB;">Spark Academy</span>, where innovation meets education. Our mission is to empower the next generation of web developers with the skills and knowledge needed to thrive in the ever-evolving digital landscape.
                    </p>
                    <asp:LinkButton ID="contactUsLinkBtn" runat="server" class="btn">Contact Us</asp:LinkButton>
                </div>
            </section>

            <section id="workFlow">
                <h2 class="heading">Who We Are </h2>
                <p class="para">
                    At <span style="color: #00B3AB;">Spark Academy</span>, we are passionate about web development and committed to providing a comprehensive learning experience.
                    <br />
                    Our team comprises industry experts, experienced educators, and enthusiastic mentors who bring real-world insights and a wealth of knowledge to the classroom.
                </p>
                <div class="num-container">
                    <div class="num-item">
                        <span>3,882
                        <br>
                            Student</span>
                    </div>
                    <div class="num-item">
                        <span>80%
                        <br>
                            Success Rate</span>
                    </div>
                    <div class="num-item">
                        <span>195
                        <br>
                            Official Collaberator</span>
                    </div>
                </div>
            </section>


            <section id="goal">
                <div class="goal-left">
                    <h2 class="heading">Our Goal</h2>
                    <p>
                        Our mission is to cultivate a learning environment that nurtures creativity, encourages critical thinking, and promotes hands-on experience. We strive to equip our students with the tools they need to succeed in the competitive world of web development, whether they are looking to start a new career, advance in their current role, or simply explore their passion for coding.
                        <br />
                        <br />
                        <h4 style="color: #00B3AB">We are able to reach that by offering a variety of methods in our learning and teaching methodoligies:</h4>
                    </p>
                    <ul>
                        <li><b>Comprehensive Courses:</b> From beginner to advanced</li>
                        <li><b>Hands-On Projects:</b> With real-world projects that help in building a portfolio that showcases skills and creativity.</li>
                        <li><b>Expert Instructors:</b> Learn from professionals with extensive experience in the field of web development.</li>
                        <li><b>Career Support:</b> We offer career counseling, resume building workshops, and job placement assistance to help you transition from learning to earning.</li>
                    </ul>
                    <asp:LinkButton ID="LinkButton1" runat="server" class="btn">Contact Us</asp:LinkButton>

                </div>
                <div class="goal-right">
                    <img src="home_image\pexels-enginakyurt-1552617.jpg" alt="">
                </div>
            </section>

            <section id="our-Team">
                <h2 class="heading">Our Members</h2>
                <div class="teamContainer">
                    <div class="team-item">
                        <img src="home_image\4646084.png" alt="">
                        <h5 class="member-name">Batool Khazali</h5>
                        <span class="role">Scrum Master and Web Developer</span>
                    </div>
                    <div class="team-item">
                        <img src="home_image\4646084.png" alt="">
                        <h5 class="member-name">Yousef Khriwech</h5>
                        <span class="role">Product Owner and Web Developer</span>
                    </div>
                    <div class="team-item">
                        <img src="home_image\4646084.png" alt="">
                        <h5 class="member-name">Omar Almahammed</h5>
                        <span class="role">Web Developer</span>
                    </div>
                    <div class="team-item">
                        <img src="home_image\4646084.png" alt="">
                        <h5 class="member-name">Rahaf Alshorman</h5>
                        <span class="role">Web Developer</span>
                    </div>
                    <div class="team-item">
                        <img src="home_image\4646084.png" alt="">
                        <h5 class="member-name">Suha Abualkarsanneh</h5>
                        <span class="role">Web Developer</span>
                    </div>
                    <div class="team-item">
                        <img src="home_image\4646084.png" alt="">
                        <h5 class="member-name">Tuqa Hrahsheh</h5>
                        <span class="role">Web Developer</span>
                    </div>
                </div>
            </section>

            <footer class="elementor-element" style="padding: 20px 0; text-align: center; background-color: #01696b; border-top: 1px solid #dee2e6; margin-top: 30px; color: white;">
                <p style="font-weight: bold;">&copy; 2024 Logo. All rights reserved.</p>
                <br>
                <p style="float: inherit;"><a>Privacy Policy</a> &nbsp; | &nbsp; <a>Terms & Conditions</a></p>
            </footer>

        </div>
    </form>
</body>
</html>

