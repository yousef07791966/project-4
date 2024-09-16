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
    public partial class showDetails : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                // Fetch query string parameters and ensure they are not null
                string studentId = Request.QueryString["id"];
                string studentName = Request.QueryString["name"];
                string coursesString = Request.QueryString["courses"];

                // Check for null values
                if (string.IsNullOrEmpty(studentId) || string.IsNullOrEmpty(studentName) || string.IsNullOrEmpty(coursesString))
                {
                    // Handle the case where query strings are missing
                    // You can redirect or show an error message
                    Response.Write("Missing required parameters.");
                    return;
                }

                // Split the courses string into an array
                string[] coursesArray = coursesString.Split(';');

                // Update labels and dropdown
                lblStudentId.Text = studentId;
                lblStudentName.Text = studentName;

                ddlCourseName.Items.Clear();
                ddlCourseName.Items.Add(new ListItem("Select a course...", ""));

                foreach (string course in coursesArray)
                {
                    ddlCourseName.Items.Add(new ListItem(course));
                }
            }
        }

        protected void ddlCourseName_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Remove the placeholder only if it exists
            ListItem placeholderItem = ddlCourseName.Items.FindByText("Select a course...");
            if (placeholderItem != null)
            {
                ddlCourseName.Items.Remove(placeholderItem);
            }

            // Get the selected course and student ID
            string selectedCourse = ddlCourseName.SelectedItem.Value;
            string studentName = Request.QueryString["id"];

            // Check for null values
            if (string.IsNullOrEmpty(selectedCourse) || string.IsNullOrEmpty(studentName))
            {
                // Handle the case where query strings or selected course are missing
                // You can redirect or show an error message
                Response.Write("Missing required parameters.");
                return;
            }

            // Construct the file path
            string checkDirectory = Server.MapPath("~/Feedback");
            string filePath = Path.Combine(checkDirectory, $"{studentName}_{selectedCourse}.txt");
            // Check if the file exists
            if (File.Exists(filePath))
            {
                string[] lines = File.ReadAllLines(filePath);
                List<Feedback> feedbackList = new List<Feedback>();

                foreach (string line in lines)
                {
                    if (line.StartsWith("Question:"))
                    {
                        var parts = line.Split(new[] { "Question:", "Answer:" }, StringSplitOptions.RemoveEmptyEntries);
                        if (parts.Length == 2)
                        {
                            feedbackList.Add(new Feedback
                            {
                                QuestionNumber = (feedbackList.Count + 1).ToString(),
                                Question = parts[0].Trim(),
                                Answer = parts[1].Trim()
                            });
                        }
                    }
                    else if (line.StartsWith("Averege:"))
                    {
                        q1.Text = line.Trim();
                    }
                }

                GridView1.DataSource = feedbackList;
                GridView1.DataBind();
            }
            else
            {
                // Handle the case where the file does not exist
                Response.Write("Survey file not found.");
            }
        }

        public class Feedback
        {
            public string QuestionNumber { get; set; }
            public string Question { get; set; }
            public string Answer { get; set; }
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

    }
}