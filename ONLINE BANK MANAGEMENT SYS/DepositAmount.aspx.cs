using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

namespace ONLINE_BANK_MANAGEMENT_SYS
{
    public partial class DepositAmount : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=BANK_DATABASE;Integrated Security=True;Connect Timeout=30;Encrypt=False");
        int balance;
        string userMobileNumber;
        protected void btnDeposit_Click(object sender, EventArgs e)
        {
            if (txtAccountNumber.Text == "" || txtAmount.Text == "")
            {
                Response.Write("ENTER ALL DETAILS");
            }
            else
            {
                GetNewBalance();
                int newBalance = balance + Convert.ToInt32(txtAmount.Text);

                try
                {
                    con.Open();
                    String query = "update AccountTable set AcBal=@AB where AcId=@AI";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@AB", newBalance);
                    cmd.Parameters.AddWithValue("@AI", txtAccountNumber.Text);
                    cmd.ExecuteNonQuery();



                    Response.Write("MONEY DEPOSITED!");
                    con.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("An error occurred: " + ex.Message);
                }
            }
        }

        private void GetNewBalance()
        {
            con.Open();
            String query = "select * from AccountTable where AcId=@an";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@an", txtAccountNumber.Text);
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                balance = Convert.ToInt32(dr["AcBal"].ToString());
            }
            con.Close();
        }
    }
}

       
