using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Survey_Project
{
    public partial class addCourses : System.Web.UI.Page
    {
        private string filePath;

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
                        // Handle case where studentUserName is null if necessary
                    }
                    else
                    {
                        Login.Style["display"] = "none";
                        Logout.Style["display"] = "inline-block";
                        Courses.Style["display"] = "inline-block";
                    }
                }

                filePath = Server.MapPath("~/courses.txt");

                TextBox1.Text = DateTime.Today.ToString("yyyy-MM-dd");
                TextBox2.Text = DateTime.Today.ToString("yyyy-MM-dd");
                TextBox3.Text = DateTime.Today.ToString("yyyy-MM-dd");
                TextBox4.Text = DateTime.Today.ToString("yyyy-MM-dd");

                EndTextBox1.Text = DateTime.Today.ToString("yyyy-MM-dd");
                EndTextBox2.Text = DateTime.Today.ToString("yyyy-MM-dd");
                EndTextBox3.Text = DateTime.Today.ToString("yyyy-MM-dd");
                EndTextBox4.Text = DateTime.Today.ToString("yyyy-MM-dd");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                filePath = Server.MapPath("~/courses.txt");
                File.WriteAllText(filePath, string.Empty);

                using (StreamWriter outputFile = new StreamWriter(filePath, true))
                {
                    try
                    {
                        for (int i = 0; i < CheckBoxList.Items.Count; i++)
                        {
                            if (CheckBoxList.Items[i].Selected)
                            {
                                string course = CheckBoxList.Items[i].Text;
                                string startDate = GetStartDateForCourse(i + 1);
                                string endDate = GetEndDateForCourse(i + 1);

                                outputFile.WriteLine($"{course},{startDate},{endDate}");
                            }
                        }

                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "showAlert();", true);
                    }
                    catch (Exception ex)
                    {
                        Response.Write($"Error writing to file: {ex.Message}");
                    }
                }
            }

            Response.Redirect("~/coursesCard.aspx");

        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("~/session.txt");
            string[] delete = { };
            File.WriteAllLines(filePath, delete);

            Response.Redirect("~/home.aspx");
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx");
        }

        private string GetStartDateForCourse(int index)
        {
            switch (index)
            {
                case 1:
                    return TextBox1.Text;
                case 2:
                    return TextBox2.Text;
                case 3:
                    return TextBox3.Text;
                case 4:
                    return TextBox4.Text;
                default:
                    return DateTime.Today.ToString("yyyy-MM-dd");
            }
        }

        private string GetEndDateForCourse(int index)
        {
            switch (index)
            {
                case 1:
                    return EndTextBox1.Text;
                case 2:
                    return EndTextBox2.Text;
                case 3:
                    return EndTextBox3.Text;
                case 4:
                    return EndTextBox4.Text;
                default:
                    return DateTime.Today.ToString("yyyy-MM-dd");
            }
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
