<%@ Page Title="" Language="C#" MasterPageFile="~/LeftSite.Master" AutoEventWireup="true" CodeBehind="DepositAmount.aspx.cs" Inherits="ONLINE_BANK_MANAGEMENT_SYS.DepositAmount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
        }

        #deposit-container {
            max-width: 400px;
            margin: 100px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            text-align: left;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }

        .error-message {
            color: red;
            margin-top: 10px;
        }

        .deposit-button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="deposit-container">
        <h2>Deposit Amount</h2>
        <div class="form-group">
            <label for="txtAccountNumber">Account Number:</label>
            <asp:TextBox ID="txtAccountNumber" runat="server" placeholder="Enter Account Number"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtAmount">Deposit Amount:</label>
            <asp:TextBox ID="txtAmount" runat="server" TextMode="Number" placeholder="Enter Amount"></asp:TextBox>
        </div>
        <asp:Button ID="btnDeposit" runat="server" Text="Deposit" CssClass="deposit-button" OnClick="btnDeposit_Click" />
        <div class="error-message">
            <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
