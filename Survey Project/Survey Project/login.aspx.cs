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
    public partial class login : System.Web.UI.Page
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


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string studentsInfoFile = Server.MapPath("~/studantsInfo.txt");
            string[] students = File.ReadAllLines(studentsInfoFile);

            string session = Server.MapPath("~/session.txt");


            string username = txtUsername.Text.Trim();
            string id = txtID.Text.Trim();
            bool condition = false;

            foreach (string line in students)
            {
                string[] user = line.Split(',');

                string studentUserName = user[0];
                string studantName= user[1];
                string studentID = user[2];
                string courses = user[3];
                string textToWrite = $"{studentUserName},{studantName},{studentID},{courses}";

                if (username == studentUserName && id == studentID) // Replace with admin ID
                {
                    File.WriteAllText(session, textToWrite);
                    condition = true;
                    Response.Redirect("~/home.aspx");
                    break;

                }


            }
            if (!condition)
            {
                newIDError.InnerText = "Invalid UserName OR ID.";

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