using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace TheSerifsAndScribes_MP
{
    public partial class Admins : System.Web.UI.Page
    {
        private enum NotificationType
        {
            Success,
            Error,
            Warning
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAdminAccounts();
                LoadMyAccount();
                LoadEditInfoFields();
            }
        }

        private void LoadAdminAccounts()
        {
            string connStr = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT adminID, username, firstName, lastName, email
                                 FROM Admin
                                 ORDER BY adminID ASC";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptAdmins.DataSource = dt;
                    rptAdmins.DataBind();

                    pnlEmpty.Visible = dt.Rows.Count == 0;
                }
            }
        }

        private void LoadMyAccount()
        {
            if (Session["AdminID"] == null)
                return;

            string connStr = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT adminID, username, firstName, lastName, email
                                 FROM Admin
                                 WHERE adminID = @adminID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@adminID", Session["AdminID"]);

                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblFullName.Text = reader["firstName"].ToString() + " " + reader["lastName"].ToString();
                            lblUsername.Text = reader["username"].ToString();
                            lblEmail.Text = reader["email"].ToString();
                        }
                    }
                }
            }
        }

        private void LoadEditInfoFields()
        {
            if (Session["AdminID"] == null)
                return;

            string connStr = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT firstName, lastName, username, email
                                 FROM Admin
                                 WHERE adminID = @adminID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@adminID", Session["AdminID"]);

                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            txtEditFirstName.Text = reader["firstName"].ToString();
                            txtEditLastName.Text = reader["lastName"].ToString();
                            txtEditUsername.Text = reader["username"].ToString();
                            txtEditEmail.Text = reader["email"].ToString();
                        }
                    }
                }
            }
        }

        protected string GetInitials(object firstName, object lastName)
        {
            string f = firstName?.ToString() ?? "";
            string l = lastName?.ToString() ?? "";

            string firstInitial = !string.IsNullOrEmpty(f) ? f.Substring(0, 1).ToUpper() : "";
            string lastInitial = !string.IsNullOrEmpty(l) ? l.Substring(0, 1).ToUpper() : "";

            return firstInitial + lastInitial;
        }

        protected void btnSaveInfo_Click(object sender, EventArgs e)
        {
            lblEditInfoMessage.Visible = true;
            lblEditInfoMessage.CssClass = "custom-error";
            lblEditInfoMessage.Text = "";

            if (Session["AdminID"] == null)
            {
                lblEditInfoMessage.Text = "Session expired. Please log in again.";
                ShowNotification("Session expired. Please log in again.", NotificationType.Error);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "openEditModal", "openModal('editInfoModal');", true);
                return;
            }

            string firstName = txtEditFirstName.Text.Trim();
            string lastName = txtEditLastName.Text.Trim();
            string username = txtEditUsername.Text.Trim();
            string email = txtEditEmail.Text.Trim();

            if (string.IsNullOrEmpty(firstName) ||
                string.IsNullOrEmpty(lastName) ||
                string.IsNullOrEmpty(username) ||
                string.IsNullOrEmpty(email))
            {
                lblEditInfoMessage.Text = "Please fill in all fields.";
                ShowNotification("Please fill in all fields.", NotificationType.Error);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "openEditModal", "openModal('editInfoModal');", true);
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string checkQuery = @"SELECT COUNT(*) 
                                      FROM Admin 
                                      WHERE (username = @username OR email = @email)
                                      AND adminID <> @adminID";

                using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn))
                {
                    checkCmd.Parameters.AddWithValue("@username", username);
                    checkCmd.Parameters.AddWithValue("@email", email);
                    checkCmd.Parameters.AddWithValue("@adminID", Session["AdminID"]);

                    int existingCount = (int)checkCmd.ExecuteScalar();

                    if (existingCount > 0)
                    {
                        lblEditInfoMessage.Text = "Username or email is already being used by another admin.";
                        ShowNotification("Username or email is already being used by another admin.", NotificationType.Error);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "openEditModal", "openModal('editInfoModal');", true);
                        return;
                    }
                }

                string updateQuery = @"UPDATE Admin
                                       SET firstName = @firstName,
                                           lastName = @lastName,
                                           username = @username,
                                           email = @email
                                       WHERE adminID = @adminID";

                using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                {
                    updateCmd.Parameters.AddWithValue("@firstName", firstName);
                    updateCmd.Parameters.AddWithValue("@lastName", lastName);
                    updateCmd.Parameters.AddWithValue("@username", username);
                    updateCmd.Parameters.AddWithValue("@email", email);
                    updateCmd.Parameters.AddWithValue("@adminID", Session["AdminID"]);

                    int rows = updateCmd.ExecuteNonQuery();

                    if (rows > 0)
                    {
                        lblEditInfoMessage.CssClass = "custom-success";
                        lblEditInfoMessage.Text = "Account information updated successfully.";
                        ShowNotification("Account information updated successfully.");

                        LoadMyAccount();
                        LoadAdminAccounts();
                        LoadEditInfoFields();

                        Session["Username"] = username;
                        Session["Email"] = email;
                        Session["FirstName"] = firstName;
                        Session["LastName"] = lastName;

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "openEditModal", "openModal('editInfoModal');", true);
                    }
                    else
                    {
                        lblEditInfoMessage.Text = "Failed to update account information.";
                        ShowNotification("Failed to update account information.", NotificationType.Error);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "openEditModal", "openModal('editInfoModal');", true);
                    }
                }
            }
        }

        protected void btnSavePassword_Click(object sender, EventArgs e)
        {
            lblChangePasswordMessage.Visible = true;
            lblChangePasswordMessage.CssClass = "custom-error";
            lblChangePasswordMessage.Text = "";

            if (Session["AdminID"] == null)
            {
                lblChangePasswordMessage.Text = "Session expired. Please log in again.";
                ShowNotification("Session expired. Please log in again.", NotificationType.Error);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "openModal", "openModal('changePasswordModal');", true);
                return;
            }

            string currentPassword = txtCurrentPassword.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (string.IsNullOrEmpty(currentPassword) ||
                string.IsNullOrEmpty(newPassword) ||
                string.IsNullOrEmpty(confirmPassword))
            {
                lblChangePasswordMessage.Text = "Please fill in all password fields.";
                ShowNotification("Please fill in all password fields.", NotificationType.Error);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "openModal", "openModal('changePasswordModal');", true);
                return;
            }

            if (newPassword != confirmPassword)
            {
                lblChangePasswordMessage.Text = "New password and confirm password do not match.";
                ShowNotification("New password and confirm password do not match.", NotificationType.Error);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "openModal", "openModal('changePasswordModal');", true);
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string checkQuery = "SELECT password FROM Admin WHERE adminID = @adminID";
                using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn))
                {
                    checkCmd.Parameters.AddWithValue("@adminID", Session["AdminID"].ToString());

                    object result = checkCmd.ExecuteScalar();

                    if (result == null)
                    {
                        lblChangePasswordMessage.Text = "Admin account not found.";
                        ShowNotification("Admin account not found.", NotificationType.Error);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "openModal", "openModal('changePasswordModal');", true);
                        return;
                    }

                    string savedPassword = result.ToString();

                    if (savedPassword != currentPassword)
                    {
                        lblChangePasswordMessage.Text = "Current password is incorrect.";
                        ShowNotification("Current password is incorrect.", NotificationType.Error);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "openModal", "openModal('changePasswordModal');", true);
                        return;
                    }
                }

                string updateQuery = "UPDATE Admin SET password = @newPassword WHERE adminID = @adminID";
                using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                {
                    updateCmd.Parameters.AddWithValue("@newPassword", newPassword);
                    updateCmd.Parameters.AddWithValue("@adminID", Session["AdminID"].ToString());

                    int rows = updateCmd.ExecuteNonQuery();

                    if (rows > 0)
                    {
                        lblChangePasswordMessage.CssClass = "custom-success";
                        lblChangePasswordMessage.Text = "Password updated successfully.";
                        ShowNotification("Password updated successfully.");

                        txtCurrentPassword.Text = "";
                        txtNewPassword.Text = "";
                        txtConfirmPassword.Text = "";

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "openModal", "openModal('changePasswordModal');", true);
                    }
                    else
                    {
                        lblChangePasswordMessage.CssClass = "custom-error";
                        lblChangePasswordMessage.Text = "Failed to update password.";
                        ShowNotification("Failed to update password.", NotificationType.Error);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "openModal", "openModal('changePasswordModal');", true);
                    }
                }
            }
        }

        protected void btnCreateAdmin_Click(object sender, EventArgs e)
        {
            lblAddAdminMessage.Visible = true;
            lblAddAdminMessage.CssClass = "custom-error";
            lblAddAdminMessage.Text = "";

            string firstName = txtAddFirstName.Text.Trim();
            string lastName = txtAddLastName.Text.Trim();
            string username = txtAddUsername.Text.Trim();
            string email = txtAddEmail.Text.Trim();
            string password = txtAddPassword.Text.Trim();
            string confirmPassword = txtAddConfirmPassword.Text.Trim();

            if (string.IsNullOrEmpty(firstName) ||
                string.IsNullOrEmpty(lastName) ||
                string.IsNullOrEmpty(username) ||
                string.IsNullOrEmpty(email) ||
                string.IsNullOrEmpty(password) ||
                string.IsNullOrEmpty(confirmPassword))
            {
                lblAddAdminMessage.Text = "Please fill in all fields.";
                ShowNotification("Please fill in all fields.", NotificationType.Error);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "openAddModal", "openModal('addAdminModal');", true);
                return;
            }

            if (password != confirmPassword)
            {
                lblAddAdminMessage.Text = "Password and confirm password do not match.";
                ShowNotification("Password and confirm password do not match.", NotificationType.Error);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "openAddModal", "openModal('addAdminModal');", true);
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlTransaction transaction = conn.BeginTransaction(IsolationLevel.Serializable);

                try
                {
                    string checkQuery = @"SELECT COUNT(*) 
                                          FROM Admin 
                                          WHERE username = @username OR email = @email";

                    using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn, transaction))
                    {
                        checkCmd.Parameters.AddWithValue("@username", username);
                        checkCmd.Parameters.AddWithValue("@email", email);

                        int existingCount = (int)checkCmd.ExecuteScalar();

                        if (existingCount > 0)
                        {
                            transaction.Rollback();
                            lblAddAdminMessage.Text = "Username or email already exists.";
                            ShowNotification("Username or email already exists.", NotificationType.Error);
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "openAddModal", "openModal('addAdminModal');", true);
                            return;
                        }
                    }

                    int nextAdminId;
                    string nextIdQuery = "SELECT ISNULL(MAX(adminID), 0) + 1 FROM Admin";

                    using (SqlCommand nextIdCmd = new SqlCommand(nextIdQuery, conn, transaction))
                    {
                        nextAdminId = Convert.ToInt32(nextIdCmd.ExecuteScalar());
                    }

                    string insertQuery = @"INSERT INTO Admin (adminID, username, firstName, lastName, password, email)
                                           VALUES (@adminID, @username, @firstName, @lastName, @password, @email)";

                    using (SqlCommand insertCmd = new SqlCommand(insertQuery, conn, transaction))
                    {
                        insertCmd.Parameters.AddWithValue("@adminID", nextAdminId);
                        insertCmd.Parameters.AddWithValue("@username", username);
                        insertCmd.Parameters.AddWithValue("@firstName", firstName);
                        insertCmd.Parameters.AddWithValue("@lastName", lastName);
                        insertCmd.Parameters.AddWithValue("@password", password);
                        insertCmd.Parameters.AddWithValue("@email", email);

                        int rows = insertCmd.ExecuteNonQuery();

                        if (rows > 0)
                        {
                            transaction.Commit();
                            lblAddAdminMessage.CssClass = "custom-success";
                            lblAddAdminMessage.Text = "New admin account created successfully.";
                            ShowNotification("New admin account created successfully.");

                            txtAddFirstName.Text = "";
                            txtAddLastName.Text = "";
                            txtAddUsername.Text = "";
                            txtAddEmail.Text = "";
                            txtAddPassword.Text = "";
                            txtAddConfirmPassword.Text = "";

                            LoadAdminAccounts();

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "openAddModal", "openModal('addAdminModal');", true);
                        }
                        else
                        {
                            transaction.Rollback();
                            lblAddAdminMessage.Text = "Failed to create admin account.";
                            ShowNotification("Failed to create admin account.", NotificationType.Error);
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "openAddModal", "openModal('addAdminModal');", true);
                        }
                    }
                }
                catch (SqlException)
                {
                    if (transaction.Connection != null)
                        transaction.Rollback();

                    lblAddAdminMessage.Text = "Failed to create admin account. Please try again.";
                    ShowNotification("Failed to create admin account. Please try again.", NotificationType.Error);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "openAddModal", "openModal('addAdminModal');", true);
                }
            }
        }

        protected void btnDeleteAdmin_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(hfSelectedAdminID.Value))
            {
                ShowNotification("Select an admin to delete first.", NotificationType.Warning);
                return;
            }

            if (Session["AdminID"] != null && hfSelectedAdminID.Value == Session["AdminID"].ToString())
            {
                ShowNotification("You cannot delete the account you are currently using.", NotificationType.Warning);
                return;
            }

            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "DELETE FROM Admin WHERE adminID = @adminID";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@adminID", hfSelectedAdminID.Value);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                LoadAdminAccounts();
                ShowNotification("Admin account deleted successfully.");
            }
            catch (SqlException)
            {
                ShowNotification("Failed to delete admin account. Please try again.", NotificationType.Error);
            }
        }

        private void ShowNotification(string message, NotificationType type = NotificationType.Success)
        {
            NotificationBar.Visible = true;
            NotificationBar.CssClass = "notification-bar";
            NotificationIcon.Text = "✓";

            switch (type)
            {
                case NotificationType.Error:
                    NotificationBar.CssClass += " is-error";
                    NotificationIcon.Text = "!";
                    break;
                case NotificationType.Warning:
                    NotificationBar.CssClass += " is-warning";
                    NotificationIcon.Text = "!";
                    break;
                default:
                    break;
            }

            NotificationMessage.Text = message;
        }
    }
}
