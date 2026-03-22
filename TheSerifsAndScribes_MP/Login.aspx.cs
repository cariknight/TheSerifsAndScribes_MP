using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace TheSerifsAndScribes_MP
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMessage.Text = "";
                lblMessage.Visible = false;
            }
        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            lblMessage.Visible = false;

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
                string query = @"SELECT adminID, username, firstName, lastName, password
                                 FROM Admin
                                 WHERE username = @username";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@username", inputUsername);

                    try
                    {
                        conn.Open();

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                string savedPassword = reader["password"].ToString();

                                if (savedPassword == inputPassword)
                                {
                                    Session["AdminID"] = reader["adminID"].ToString();
                                    Session["Username"] = reader["username"].ToString();
                                    Session["FirstName"] = reader["firstName"].ToString();
                                    Session["LastName"] = reader["lastName"].ToString();

                                    Response.Redirect("~/AdminDashboard.aspx");
                                }
                                else
                                {
                                    lblMessage.Text = "Invalid username or password.";
                                    lblMessage.Visible = true;
                                }
                            }
                            else
                            {
                                lblMessage.Text = "Invalid username or password.";
                                lblMessage.Visible = true;
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Database error: " + ex.Message;
                        lblMessage.Visible = true;
                    }
                }
            }
        }
    }
}