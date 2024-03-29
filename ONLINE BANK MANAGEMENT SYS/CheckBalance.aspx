<%@ Page Title="" Language="C#" MasterPageFile="~/LeftSite.Master" AutoEventWireup="true" CodeBehind="CheckBalance.aspx.cs" Inherits="ONLINE_BANK_MANAGEMENT_SYS.CheckBalance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
        }

        .content-container {
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

        .btn-check-balance {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .result-container {
            margin-top: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-container">
        <h2>Check Balance</h2>

        <div class="form-group">
            <label for="txtAccountNumber">Enter Account Number:</label>
            <asp:TextBox ID="txtAccountNumber" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <asp:Button ID="btnCheckBalance" runat="server" Text="Check Balance" CssClass="btn-check-balance" OnClick="btnCheckBalance_Click" />

        <div class="result-container">
            <asp:Label ID="lblBalance" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>

