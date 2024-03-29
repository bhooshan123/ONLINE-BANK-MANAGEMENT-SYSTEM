using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace ONLINE_BANK_MANAGEMENT_SYS
{
    public partial class TransferAmount : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=BANK_DATABASE;Integrated Security=True;Connect Timeout=30;Encrypt=False");

        protected void btnTransfer_Click(object sender, EventArgs e)
        {
            if (txtFromAccount.Text == "" || txtToAccount.Text == "")
            {
                lblErrorMessage.Text = "ENTER ALL DETAILS";
                return;
            }

            int transferFrom;
            if (!int.TryParse(txtFromAccount.Text, out transferFrom))
            {
                lblErrorMessage.Text = "Invalid 'From' account number. Please enter a valid numeric value.";
                return;
            }

            int transferTo;
            if (!int.TryParse(txtToAccount.Text, out transferTo))
            {
                lblErrorMessage.Text = "Invalid 'To' account number. Please enter a valid numeric value.";
                return;
            }

            int transferAmount;
            if (!int.TryParse(txtTransferAmount.Text, out transferAmount))
            {
                lblErrorMessage.Text = "Invalid transfer amount. Please enter a valid numeric value.";
                return;
            }

            try
            {
                con.Open();

                // Check if 'From' account has sufficient balance
                SqlCommand checkBalanceCmd = new SqlCommand("SELECT AcBal FROM AccountTable WHERE AcId = @FromId", con);
                checkBalanceCmd.Parameters.AddWithValue("@FromId", transferFrom);

                int fromBalance = (int)checkBalanceCmd.ExecuteScalar();

                if (fromBalance < transferAmount)
                {
                    lblErrorMessage.Text = "Insufficient balance in the 'From' account.";
                    return;
                }

                SqlCommand updateFromCmd = new SqlCommand("UPDATE AccountTable SET AcBal = AcBal - @TransferAmount WHERE AcId = @FromId", con);
                updateFromCmd.Parameters.AddWithValue("@TransferAmount", transferAmount);
                updateFromCmd.Parameters.AddWithValue("@FromId", transferFrom);
                updateFromCmd.ExecuteNonQuery();

                SqlCommand updateToCmd = new SqlCommand("UPDATE AccountTable SET AcBal = AcBal + @TransferAmount WHERE AcId = @ToId", con);
                updateToCmd.Parameters.AddWithValue("@TransferAmount", transferAmount);
                updateToCmd.Parameters.AddWithValue("@ToId", transferTo);
                updateToCmd.ExecuteNonQuery();

                lblErrorMessage.Text = "Transfer successful!";
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = $"An error occurred during the transfer: {ex.Message}";
            }
            finally
            {
                con.Close();
                txtFromAccount.Text = "";
                txtToAccount.Text = "";
                txtTransferAmount.Text = "";
            }
        }
    }
}
