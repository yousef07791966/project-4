using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace Survey_Project
{
    public partial class studentFeedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            GenerateQuestionPanels();


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


        protected void GenerateQuestionPanels()
        {
            string[] path = File.ReadAllLines("C:\\Users\\Orange\\Desktop\\Survey Project\\Survey Project\\path.txt");
            string language = path[0].Trim();
                       
            string[] questions = File.ReadAllLines($"C:\\Users\\Orange\\Desktop\\Survey Project\\Survey Project\\questions\\{language}_questions.txt");

            for (int j = 0; j < questions.Length; j++)
            {
                Panel panel = new Panel();
                panel.CssClass = "px-4";

                Label lblQuestion = new Label();
                lblQuestion.Text = questions[j];
                lblQuestion.ID = $"question{j + 1}";
                panel.Controls.Add(lblQuestion);

                LiteralControl breakTag1 = new LiteralControl("<br />");
                panel.Controls.Add(breakTag1);

                RadioButtonList rblAnswers = new RadioButtonList();
                rblAnswers.ID = $"rblAnswer{j}";
                rblAnswers.Items.Add(new ListItem("Excellent"));
                rblAnswers.Items.Add(new ListItem("Very Good"));
                rblAnswers.Items.Add(new ListItem("Good"));
                rblAnswers.Items.Add(new ListItem("Poor"));
                panel.Controls.Add(rblAnswers);

                //questionIDs.Add(rblAnswers.ID);
                //Session["questionIDs"] = questionIDs;


                LiteralControl lineBreak = new LiteralControl("<hr />");
                panel.Controls.Add(lineBreak);

                PanelContainer.Controls.Add(panel);




            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string[] path = File.ReadAllLines("C:\\Users\\Orange\\Desktop\\Survey Project\\Survey Project\\path.txt");
            string language = path[0].Trim();

            string[] questions = File.ReadAllLines($"C:\\Users\\Orange\\Desktop\\Survey Project\\Survey Project\\questions\\{language}_questions.txt");



            //List<string> questionIDs = (List<string>)Session["questionIDs"];
            List<string> questionIDs = new List<string>();
            for (int j = 0; j < questions.Length; j++)
            {
                string ids = $"rblAnswer{j}";
                questionIDs.Add(ids);

            }

            bool allAnswered = true;
            foreach (string id in questionIDs)
            {
                RadioButtonList rbl = PanelContainer.FindControl(id) as RadioButtonList;
                if (rbl != null && rbl.SelectedItem == null)
                {
                    allAnswered = false;
                    break;
                }
            }

            if (allAnswered)
            {
                string session = Server.MapPath("~/session.txt");
                string[] userLogIn = File.ReadAllLines(session);
                string studentName = "";
                foreach (string item in userLogIn)
                {
                    string[] user = item.Split(',');
                    studentName = user[1];
                }

                string feedbackDirectory = Server.MapPath("~/Feedback");
                string feedbackFilePath = Path.Combine(feedbackDirectory, $"{studentName}_{language}.txt");

                if (!Directory.Exists(feedbackDirectory))
                {
                    Directory.CreateDirectory(feedbackDirectory);
                }

                using (StreamWriter writer = new StreamWriter(feedbackFilePath, true))
                {

                    int rate = 0;
                    for (int j = 0; j < questions.Length; j++)
                    {
                        {
                            RadioButtonList rblAnswers = PanelContainer.FindControl($"rblAnswer{j}") as RadioButtonList;

                            if (rblAnswers != null && rblAnswers.SelectedItem != null)
                            {
                                string selectedAnswer = rblAnswers.SelectedValue;

                                writer.WriteLine($"Question: {questions[j]}, Answer: {selectedAnswer}");



                                if (selectedAnswer == "Excellent")
                                {
                                    rate = rate + 100;
                                }
                                else if (selectedAnswer == "Very Good")
                                {
                                    rate = rate + 75;

                                }
                                else if (selectedAnswer == "Good")
                                {
                                    rate = rate + 50;

                                }
                                else
                                {
                                    rate = rate + 25;
                                }

                            }
                        }
                    }

                    writer.WriteLine($"Averege: {rate / questions.Length}");
                }

                Response.Redirect("~/studentsCourses.aspx");

            }
            else
            {
                //lblMessage.ForeColor = System.Drawing.Color.Red;
                //lblMessage.Text = "Please answer all questions.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "feedbackAlert", "alert('Please answer all questions.');", true);

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