using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace ONLINE_BANK_MANAGEMENT_SYS
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string accountNumber = txtAccountNumber.Text;
            string accountType = ddlAccountType.SelectedValue;
            string username = txtUsername.Text;
            string gender = ddlGender.SelectedValue;
            string email = txtEmail.Text;
            string address = txtAddress.Text;
            string mobileNumber = txtMobileNumber.Text;
            string occupation = txtOccupation.Text;
            int monthlyIncome = Convert.ToInt32(txtMonthlyIncome.Text);
            string education = ddlEducation.SelectedValue;
            int amount = Convert.ToInt32(txtAmount.Text);
            string password = txtPassword.Text;

            if (string.IsNullOrEmpty(accountNumber) || string.IsNullOrEmpty(accountType) ||
                string.IsNullOrEmpty(username) || string.IsNullOrEmpty(gender) ||
                string.IsNullOrEmpty(email) || string.IsNullOrEmpty(address) ||
                string.IsNullOrEmpty(mobileNumber) || string.IsNullOrEmpty(occupation) ||
                monthlyIncome <= 0 || string.IsNullOrEmpty(education) || amount <= 0 ||
                string.IsNullOrEmpty(password))
            {
                lblErrorMessage.Text = "Please fill in all fields.";
            }
            else
            {
                if (SaveUserToDatabase(accountNumber, accountType, username, gender, email, address, mobileNumber, occupation, monthlyIncome, education, amount, password))
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    lblErrorMessage.Text = "Registration failed. Please try again.";
                }
            }
        }

        private bool SaveUserToDatabase(string accountNumber, string accountType, string username, string gender, string email, string address, string mobileNumber, string occupation, int monthlyIncome, string education, int amount, string password)
        {
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["cs"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "INSERT INTO AccountTable (AcName, AcPassword, AcAddress, Acgender, AcOccu, AcEdu, AcInc, AcBal, AcPhone) " +
                                   "VALUES (@AcName, @AcPassword, @AcAddress, @Acgender, @AcOccu, @AcEdu, @AcInc, @AcBal, @AcPhone)";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@AcName", username);
                        command.Parameters.AddWithValue("@AcPassword", password);
                        command.Parameters.AddWithValue("@AcAddress", address);
                        command.Parameters.AddWithValue("@Acgender", gender);
                        command.Parameters.AddWithValue("@AcOccu", occupation);
                        command.Parameters.AddWithValue("@AcEdu", education);
                        command.Parameters.AddWithValue("@AcInc", monthlyIncome);
                        command.Parameters.AddWithValue("@AcBal", amount);
                        command.Parameters.AddWithValue("@AcPhone", mobileNumber);
                        command.ExecuteNonQuery();
                    }
                }

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
