using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace ONLINE_BANK_MANAGEMENT_SYS
{
    public partial class CheckBalance : Page
    {
        private readonly SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=BANK_DATABASE;Integrated Security=True;Connect Timeout=30;Encrypt=False");
        private int balance;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        private void Checkbal()
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
                lblBalance.Text = "Rs." + dr["AcBal"].ToString();
                balance = Convert.ToInt32(dr["AcBal"].ToString());
            }
            con.Close();
        }

        protected void btnCheckBalance_Click(object sender, EventArgs e)
        {
            if (txtAccountNumber.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('ENTER ACCOUNT NUMBER')", true);
            }
            else
            {
                Checkbal();
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
