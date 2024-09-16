using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Survey_Project
{
    public partial class showStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)    
        {
            if (!IsPostBack)
            {
                BindGrid();


                ////////////////////////
                ///

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
        }

        private void BindGrid()
        {
            string filePath = Server.MapPath("~/studantsInfo.txt");
            var studentList = new List<Student>();

            if (File.Exists(filePath))
            {
                string[] lines = File.ReadAllLines(filePath);
                foreach (var line in lines)
                {
                    var parts = line.Split(',');
                    if (parts.Length > 3)
                    {
                        var email = parts[0];
                        var id = parts[1];
                        var name = parts[2];

                        var courses = string.Join(";", parts.Skip(3));

                        studentList.Add(new Student
                        {
                            ID = id,
                            Name = name,
                            Email = email,
                            Courses = courses
                        });
                    }
                }
            }

            GridView1.DataSource = studentList;
            GridView1.DataBind();
        }

        protected void btnSort_Click(object sender, EventArgs e)
        {
            string sortBy = ddlSort.SelectedValue;
            string filePath = Server.MapPath("~/studantsInfo.txt");
            var studentList = new List<Student>();

            if (File.Exists(filePath))
            {
                string[] lines = File.ReadAllLines(filePath);
                foreach (var line in lines)
                {
                    var parts = line.Split(',');
                    if (parts.Length > 3)
                    {
                        var id = parts[0];
                        var name = parts[1];
                        var email = parts[2];
                        var courses = string.Join(";", parts.Skip(3));

                        studentList.Add(new Student
                        {
                            ID = id,
                            Name = name,
                            Email = email,
                            Courses = courses
                        });
                    }
                }
            }

            switch (sortBy)
            {
                case "ID":
                    studentList = studentList.OrderBy(s => s.ID).ToList();
                    break;
                case "Name":
                    studentList = studentList.OrderBy(s => s.Name).ToList();
                    break;
                case "Email":
                    studentList = studentList.OrderBy(s => s.Email).ToList();
                    break;
            }

            GridView1.DataSource = studentList;
            GridView1.DataBind();
        }

        public class Student
        {
            public string ID { get; set; }
            public string Name { get; set; }
            public string Email { get; set; }
            public string Courses { get; set; }
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

            Response.Redirect("~/home.aspx");
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