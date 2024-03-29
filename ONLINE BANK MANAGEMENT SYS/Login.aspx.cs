using System;
using System.Data.SqlClient;
using System.Resources;
using System.Web.Configuration;
using System.Web.UI;

namespace ONLINE_BANK_MANAGEMENT_SYS
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string imageUrl = GetImageUrlFromResource();

            imgLogo.ImageUrl = imageUrl;
        }

        private string GetImageUrlFromResource()  
        {
            object imageUrlObject = Resource1.profile;

            if (imageUrlObject != null)
            {
                return imageUrlObject.ToString();
            }
            else
            {
                return string.Empty;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                Response.Write("<script>alert('PLEASE ENTER ALL DETAILS')</script>");
            }
            else
            {
                if (AuthenticateUser(username, password))
                {
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid username or password. Please try again.";
                }
            }

        }
        protected void btnRegister_Click(Object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
        protected void hlForgotPassword_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("ForgotPassword.aspx");
        }

        private bool AuthenticateUser(string username, string password)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["cs"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT COUNT(*) FROM AccountTable WHERE AcName = @name AND AcPassword= @password";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@name", username);
                    command.Parameters.AddWithValue("@Password", password);

                    int count = (int)command.ExecuteScalar();

                    return count > 0;
                }
            }
        }
    }
}
