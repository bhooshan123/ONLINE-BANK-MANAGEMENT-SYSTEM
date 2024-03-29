<%@ Page Title="" Language="C#" MasterPageFile="~/LeftSite.master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="ONLINE_BANK_MANAGEMENT_SYS.Dashboard" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="dashboard-container" style="display: flex; flex-direction: column; align-items: center; height: 100vh;">

    <div class="quick-services" style="background-color: #ecf0f1; padding: 20px; margin-bottom: 20px;">
        <h2>Quick Services</h2>

        
        <div class="dashboard-card" style="background-color: #2ecc71; height: 150px; width: 300px; margin-bottom: 20px; text-align: center;">
            <div class="dashboard-option">
                <a href="CheckBalance.aspx" style="color: white; font-size: 30px; line-height: 150px;">Check Balance</a>
            </div>
        </div>

        <div class="dashboard-card" style="background-color: #e74c3c; height: 150px; width: 300px; margin-bottom: 20px; text-align: center;">
            <div class="dashboard-option">
                <a href="DepositAmount.aspx" style="color: white; font-size: 30px; line-height: 150px;">Deposit Amount</a>
            </div>
        </div>

        <div class="dashboard-card" style="background-color: #f39c12; height: 150px; width: 300px; margin-bottom: 20px; text-align: center;">
            <div class="dashboard-option">
                <a href="TransferAmount.aspx" style="color: white; font-size: 30px; line-height: 150px;">Transfer Amount</a>
            </div>
        </div>

        <div class="dashboard-card" style="background-color: #9b59b6; height: 150px; width: 300px; margin-bottom: 20px; text-align: center;">
            <div class="dashboard-option">
                <a href="WithdrawAmount.aspx" style="color: white; font-size: 30px; line-height: 150px;">Withdraw Amount</a>
            </div>
        </div>
    </div>

  
  </div>
</asp:Content>
