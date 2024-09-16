using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.EnterpriseServices.CompensatingResourceManager;

namespace Survey_Project
{
    public partial class studentsCourses : System.Web.UI.Page
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

            ////////////////////////////////////////////////////////////////////////////////
            ///

            string filePath = "C:\\Users\\Orange\\Desktop\\Survey Project\\Survey Project\\session.txt";
            string userAfterLogin = File.ReadAllText(filePath);
            string[] userInfo = userAfterLogin.Split(',');

            string[] courses = userInfo.Skip(3).SelectMany(languages => languages.Split(';')).ToArray();

            for (int i = 0; i < courses.Length; i++)
            {
                // Create a new HtmlGenericControl for the card
                HtmlGenericControl cardDiv = new HtmlGenericControl("div");
                cardDiv.Attributes["class"] = "card mb-3";
                //cardDiv.Attributes["style"] = "max-width: 800px;"; // Adjust width as needed

                // Create the card body wrapper (row)
                HtmlGenericControl cardBodyWrapper = new HtmlGenericControl("div");
                cardBodyWrapper.Attributes["class"] = "row g-0";

                // Create the card image column (col-md-4)
                HtmlGenericControl cardImgColumn = new HtmlGenericControl("div");
                cardImgColumn.Attributes["class"] = "col-md-4";


                HtmlGenericControl cardImg = new HtmlGenericControl("img");
                cardImg.Attributes["src"] = "https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y29kaW5nfGVufDB8fDB8fHww"; // Add your image source
                cardImg.Attributes["class"] = "card-img";
                cardImg.Attributes["alt"] = "Card Image";
                cardImgColumn.Controls.Add(cardImg); // Add image to the image column

                // Create the card body column (col-md-8)
                HtmlGenericControl cardBodyColumn = new HtmlGenericControl("div");
                cardBodyColumn.Attributes["class"] = "col-md-8";

                // Create the card body
                HtmlGenericControl cardBody = new HtmlGenericControl("div");
                cardBody.Attributes["class"] = "card-body";

                // Create the card title
                HtmlGenericControl cardTitle = new HtmlGenericControl("h5");
                cardTitle.Attributes["class"] = "card-title";
                cardTitle.InnerText = $"Course: {courses[i]}";

                // Create the card text
                HtmlGenericControl cardText = new HtmlGenericControl("p");
                cardText.Attributes["class"] = "card-text";
                cardText.InnerText = $"Discover our programming courses designed to help you learn and master new skills. Each course card highlights a different programming language, explaining its key features and uses. Whether you want to start with Python, explore Java, or dive into C++, our courses provide clear and practical lessons. Choose the course that fits your goals and start your journey into the world of programming today."; // Example text

                // Create the button group wrapper
                HtmlGenericControl buttonGroup = new HtmlGenericControl("div");
                buttonGroup.Attributes["class"] = "d-flex justify-content-end mt-3"; // Adjust margin top to separate from the card text

                // Create the Feedback button
                Button Feedback = new Button();
                Feedback.ID = $"courseFeedback_{courses[i]}";
                Feedback.Text = "Feedback";
                Feedback.CssClass = "btn btn-secondary me-2";
                Feedback.Click += new EventHandler(FeedBackClick);
                Feedback.CommandArgument = courses[i];
                buttonGroup.Controls.Add(Feedback);

                // Create the Start Course button
                Button StartCourse = new Button();
                StartCourse.ID = $"courseStart_{courses[i]}";
                StartCourse.Text = "Start Course";
                StartCourse.CssClass = "btn btn-primary";
                StartCourse.Style.Add("background-color", "#d85427");
                StartCourse.Click += new EventHandler(StartCourseClick);
                StartCourse.CommandArgument = courses[i];
                buttonGroup.Controls.Add(StartCourse);


                // Append elements to the card body
                cardBody.Controls.Add(cardTitle);
                cardBody.Controls.Add(cardText);
                cardBody.Controls.Add(buttonGroup); // This ensures the button group is below the text


                // Append elements to the card body column
                cardBodyColumn.Controls.Add(cardBody);

                // Append image column and body column to the card body wrapper
                cardBodyWrapper.Controls.Add(cardImgColumn);
                cardBodyWrapper.Controls.Add(cardBodyColumn);

                // Append card body wrapper to the card div
                cardDiv.Controls.Add(cardBodyWrapper);

                // Add the card div to the placeholder
                CardPlaceHolder.Controls.Add(cardDiv);

            }
        }

        protected void StartCourseClick(object sender, EventArgs e)
        {
            string session = Server.MapPath("~/session.txt");
            string[] userLogIn = File.ReadAllLines(session);
            string studentUserName = "";

            foreach (string item in userLogIn)
            {
                string[] user = item.Split(',');
                studentUserName = user[1];
            }

            Button StartCourseButton = sender as Button;
            string courseTitle = StartCourseButton.CommandArgument;

            string checkDirectory = Server.MapPath("~/Feedback");
            string check = Path.Combine(checkDirectory, $"{studentUserName}_{courseTitle}.txt");

            if (File.Exists(check))
            {
                Response.Redirect("https://www.udemy.com/course/learn-c-sharp-programming-in-ten-easy-steps/?couponCode=ST9MT71624");

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "feedbackAlert", "alert('Please Fill your Feedback');", true);
            }
        }

        protected void FeedBackClick(object sender, EventArgs e)
        {
            Button feedbackButton = sender as Button;
            string courseTitle = feedbackButton.CommandArgument;


            string filePath = "C:\\Users\\Orange\\Desktop\\Survey Project\\Survey Project\\path.txt";
            string[] delete = { };
            File.WriteAllLines(filePath, delete);
            File.WriteAllText(filePath, $"{courseTitle}");

            string session = Server.MapPath("~/session.txt");
            string[] userLogIn = File.ReadAllLines(session);
            string studentUserName = "";

            foreach (string item in userLogIn)
            {
                string[] user = item.Split(',');
                studentUserName = user[1];
            }
            string checkDirectory = Server.MapPath("~/Feedback");
            string check = Path.Combine(checkDirectory, $"{studentUserName}_{courseTitle}.txt");
            //string check = Server.MapPath($"\"C:\\Users\\Orange\\Desktop\\Survey Project\\Survey Project\\Feedback\\{studentUserName}_{courseTitle}.txt\"");
            if (!File.Exists(check))
            {
                Response.Redirect("studentFeedback.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "feedbackAlert", "alert('Thank You! You are already fill the survey.');", true);
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
    }
}