﻿using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Survey_Project
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string session = Server.MapPath("~/session.txt");
                string[] userLogIn = File.ReadAllLines(session);

                foreach (string item in userLogIn)
                {
                    string[] user = item.Split(',');
                    string studentUserName = user[0];

                    if (studentUserName == "admin@admin.com")
                    {
                        Login.Style["display"] = "none";
                        Logout.Style["display"] = "inline-block";
                        Dashboard.Style["display"] = "inline-block";
                    }
                    else if (studentUserName == null)
                    {

                    }
                    else
                    {
                        Login.Style["display"] = "none";
                        Logout.Style["display"] = "inline-block";
                        Courses.Style["display"] = "inline-block";

                    }
                }
            }
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            string filePath = "C:\\Users\\Orange\\Desktop\\Survey Project\\Survey Project\\session.txt";
            string[] delete = { };
            File.WriteAllLines(filePath, delete);

            Response.Redirect("~/home.aspx");
        }

        protected void Login_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/login.aspx");
        }

        protected void homepageLinkBtn_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/home.aspx");
        }


        protected void showCoursesLinkBtn_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/coursesCard.aspx");
        }

        protected void newCoursesLinkBtn_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/addCourses.aspx");
        }

        protected void newSurveyLinkBtn_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/home.aspx");
        }

        protected void showSurveyLinkBtn_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/home.aspx");
        }

        protected void coursesResultsLinkBtn_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/surveyresult.aspx");
        }

        protected void addStudentLinkBtn_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/addStudent.aspx");
        }

        protected void studentsListLinkBtn_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/showStudent.aspx");
        }
    }
}