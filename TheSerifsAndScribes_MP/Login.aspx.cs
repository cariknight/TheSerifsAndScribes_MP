using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheSerifsAndScribes_MP
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMessage.Text = "";
            }
        }
        protected void loginBtn_Click(object sender, EventArgs e)
        {
            string inputUsername = username.Text.Trim();
            string inputPassword = password.Text.Trim();

            if (string.IsNullOrEmpty(inputUsername) || string.IsNullOrEmpty(inputPassword))
            {
                lblMessage.Text = "Please enter both username and password.";
                lblMessage.Visible = true;
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT adminID, username, firstName, lastName, role
                                 FROM Admin
                                 WHERE username = @username AND password = @password";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@username", inputUsername);
                    cmd.Parameters.AddWithValue("@password", inputPassword);

                    try
                    {
                        conn.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            Session["AdminID"] = reader["adminID"].ToString();
                            Session["Username"] = reader["username"].ToString();
                            Session["FirstName"] = reader["firstName"].ToString();
                            Session["LastName"] = reader["lastName"].ToString();
                            Session["Role"] = reader["role"].ToString();

                            Response.Redirect("~/AdminDashboard.aspx");
                        }
                        else
                        {
                            lblMessage.Text = "Invalid username or password.";
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Unable to connect to the database.";
                    }
                }
            }
        }
    }
}