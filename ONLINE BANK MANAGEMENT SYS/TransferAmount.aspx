<%@ Page Title="" Language="C#" MasterPageFile="~/LeftSite.Master" AutoEventWireup="true" CodeBehind="TransferAmount.aspx.cs" Inherits="ONLINE_BANK_MANAGEMENT_SYS.TransferAmount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
        }

        #transfer-container {
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

        .transfer-button {
            background-color: #5bc0de;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="transfer-container">
        <h2>Transfer Amount</h2>
        <div class="form-group">
            <label for="txtFromAccount">From Account Number:</label>
            <asp:TextBox ID="txtFromAccount" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtToAccount">To Account Number:</label>
            <asp:TextBox ID="txtToAccount" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtTransferAmount">Transfer Amount:</label>
            <asp:TextBox ID="txtTransferAmount" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
        </div>
        <asp:Button ID="btnTransfer" runat="server" Text="Transfer" CssClass="transfer-button" OnClick="btnTransfer_Click" />
        <div class="error-message">
            <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>

