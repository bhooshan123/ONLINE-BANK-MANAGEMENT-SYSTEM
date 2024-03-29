<%@ Page Title="" Language="C#" MasterPageFile="~/LeftSite.Master" AutoEventWireup="true" CodeBehind="WithdrawAmount.aspx.cs" Inherits="ONLINE_BANK_MANAGEMENT_SYS.WithdrawAmount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
        }

        #withdraw-container {
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

        .withdraw-button {
            background-color: #d9534f;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="withdraw-container">
        <h2>Withdraw Amount</h2>
        <div class="form-group">
            <label for="txtAccountNumber">Account Number:</label>
            <asp:TextBox ID="txtAccountNumber" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtAmount">Withdraw Amount:</label>
            <asp:TextBox ID="txtAmount" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
        </div>
        <asp:Button ID="btnWithdraw" runat="server" Text="Withdraw" CssClass="withdraw-button" OnClick="btnWithdraw_Click" />
        <div class="error-message">
            <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
