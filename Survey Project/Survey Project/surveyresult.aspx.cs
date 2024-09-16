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
    public partial class surveyresult : System.Web.UI.Page
    {

        protected Dictionary<string, int> feedbackPercentages;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCategory_SelectedIndexChanged();
                Session["feedbackPercentages"] = feedbackPercentages;


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
            else
            {
                feedbackPercentages = Session["feedbackPercentages"] as Dictionary<string, int>;
            }
        }

        protected void ddlCategory_SelectedIndexChanged()
        {
            feedbackPercentages = new Dictionary<string, int>();
            string filePath = Server.MapPath("value.txt");

            if (File.Exists(filePath))
            {
                string[] lines = File.ReadAllLines(filePath);

                foreach (string line in lines)
                {
                    string[] parts = line.Split('=');
                    if (parts.Length == 2 && int.TryParse(parts[1], out int percentage))
                    {
                        feedbackPercentages[parts[0].ToLower()] = percentage;
                    }
                }
            }
            //else
            //{
            //    // Handle the case where the file does not exist
            //    feedbackPercentages["csharp"] = 90;
            //    feedbackPercentages["php"] = 75;
            //    feedbackPercentages["nodejs"] = 85;
            //    feedbackPercentages["frontend"] = 95;
            //}
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = ddlCategory.SelectedValue.ToLower();

            if (feedbackPercentages != null && feedbackPercentages.TryGetValue(selectedValue, out int percentage))
            {
                lblPercentage.Text = percentage.ToString();

                if (percentage >= 85)
                {
                    result.Style["background-color"] = "green";
                }
                else
                {
                    result.Style["background-color"] = "red";
                }
            }
            else
            {
                lblPercentage.Text = "0";
                result.Style["background-color"] = "red";
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
