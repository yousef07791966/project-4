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
    public partial class addStudent : System.Web.UI.Page
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

        protected void btnSubmit_Click1(object sender, EventArgs e)
        {
            // Validate and get the input values
            int id;
            if (!int.TryParse(txtId.Text, out id))
            {
                // Display an error message if the ID is not a valid integer
                Response.Write("<script>alert('Please enter a valid integer for ID.');</script>");
                return;
            }

            string name = txtName.Text;
            string email = txtEmail.Text;

            // Get the selected courses
            string courses = "";
            if (chkCourse1.Checked)
                courses += "NodeJS;";
            if (chkCourse2.Checked)
                courses += "CSharp;";
            if (chkCourse3.Checked)
                courses += "Front-end Development;";
            if (chkCourse4.Checked)
                courses += "PHP;";

            // Remove the trailing comma
            if (courses.Length > 0)
                courses = courses.Substring(0, courses.Length - 1);

            // Create the student information string
            string studentInfo = $"{email},{name},{id},{courses}";

            // Save the student information to a text file
            string filePath = Server.MapPath("~/studantsInfo.txt");
            //File.AppendAllText(filePath, studentInfo + Environment.NewLine);

            using (StreamWriter sw = new StreamWriter(filePath, true))
            {
                sw.WriteLine(studentInfo);
            }

            // Clear the form
            txtId.Text = "";
            txtName.Text = "";
            txtEmail.Text = "";
            chkCourse1.Checked = false;
            chkCourse2.Checked = false;
            chkCourse3.Checked = false;
            chkCourse4.Checked = false;

            // Display a success message
            Response.Write("<script>alert('Student information saved successfully.');</script>");
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