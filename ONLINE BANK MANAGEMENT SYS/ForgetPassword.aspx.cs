using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace ONLINE_BANK_MANAGEMENT_SYS
{
    public partial class ForgotPassword : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string email = txtEmail.Text;
            string newPassword = txtNewPassword.Text;

            if (IsValidInput(username, email, newPassword))
            {
                if (UpdatePasswordInDatabase(username, newPassword))
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    lblMessage.Text = "Failed to update password. Please try again.";
                }
            }
        }

        private bool IsValidInput(string username, string email, string newPassword)
        {
           
            return !string.IsNullOrEmpty(username) &&
                   !string.IsNullOrEmpty(email) &&
                   !string.IsNullOrEmpty(newPassword);
        }

        private bool UpdatePasswordInDatabase(string username, string newPassword)
        {
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["cs"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    
                    string query = "UPDATE AccountTable SET AcPassword = @Password WHERE AcName = @Username";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Password", newPassword);
                        command.Parameters.AddWithValue("@Username", username);

                        int rowsAffected = command.ExecuteNonQuery();

                        return rowsAffected > 0;
                    }
                }
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
