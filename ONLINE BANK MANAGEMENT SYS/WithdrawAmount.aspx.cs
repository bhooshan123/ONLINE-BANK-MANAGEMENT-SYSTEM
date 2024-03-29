using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace ONLINE_BANK_MANAGEMENT_SYS
{
    public partial class WithdrawAmount : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=BANK_DATABASE;Integrated Security=True;Connect Timeout=30;Encrypt=False");
        int balance;

        protected void btnWithdraw_Click(object sender, EventArgs e)
        {
            if (txtAccountNumber.Text == "" || txtAmount.Text == "")
            {
                lblErrorMessage.Text = "ENTER ALL DETAILS";
            }
            else
            {
                GetNewBalance();
                int newBalance = balance - Convert.ToInt32(txtAmount.Text);

                if (newBalance < 0)
                {
                    lblErrorMessage.Text = "INSUFFICIENT BALANCE";
                }
                else
                {
                    try
                    {
                        con.Open();
                        string query = "update AccountTable set AcBal=@AB where AcId=@AI";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@AB", newBalance);
                        cmd.Parameters.AddWithValue("@AI", txtAccountNumber.Text);
                        cmd.ExecuteNonQuery();

                        lblErrorMessage.Text = "MONEY WITHDRAWN!";
                        con.Close();
                    }
                    catch (Exception ex)
                    {
                        lblErrorMessage.Text = "An error occurred: " + ex.Message;
                    }
                }
            }
        }

        private void GetNewBalance()
        {
            con.Open();
            string query = "select * from AccountTable where AcId=@an";
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
