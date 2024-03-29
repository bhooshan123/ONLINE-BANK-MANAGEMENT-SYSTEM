<%@ Page Title="" Language="C#" MasterPageFile="~/TOP.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="ONLINE_BANK_MANAGEMENT_SYS.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
        }

        #registration-container {
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

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }

        .error-message {
            color: red;
            margin-top: 10px;
        }

        .register-button {
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
    <div id="registration-container">
        <h2>Registration</h2>
        <div class="form-group">
            <label for="txtAccountNumber">Account Number:</label>
            <asp:TextBox ID="txtAccountNumber" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="ddlAccountType">Account Type:</label>
            <asp:DropDownList ID="ddlAccountType" runat="server">
                <asp:ListItem Text="Savings" Value="Savings"></asp:ListItem>
                <asp:ListItem Text="Checking" Value="Checking"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <label for="txtUsername">Username:</label>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="ddlGender">Gender:</label>
            <asp:DropDownList ID="ddlGender" runat="server">
                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <label for="txtEmail">Email:</label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtAddress">Address:</label>
            <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtMobileNumber">Mobile Number:</label>
            <asp:TextBox ID="txtMobileNumber" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtOccupation">Occupation:</label>
            <asp:TextBox ID="txtOccupation" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtMonthlyIncome">Monthly Income:</label>
            <asp:TextBox ID="txtMonthlyIncome" runat="server" TextMode="Number"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="ddlEducation">Educational Qualification:</label>
            <asp:DropDownList ID="ddlEducation" runat="server">
                <asp:ListItem Text="High School" Value="High School"></asp:ListItem>
                <asp:ListItem Text="Uneducated" Value="Associate's Degree"></asp:ListItem>
                <asp:ListItem Text="Bachelor's Degree" Value="Bachelor's Degree"></asp:ListItem>
                <asp:ListItem Text="Master's Degree" Value="Master's Degree"></asp:ListItem>
                <asp:ListItem Text="Doctorate" Value="Doctorate"></asp:ListItem>
            </asp:DropDownList>            
        </div>
        <div class="form-group">
            <label for="txtAmount">Amount:</label>
            <asp:TextBox ID="txtAmount" runat="server" TextMode="Number"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtPassword">Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        </div>
        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="register-button" OnClick="btnRegister_Click" />
        <div class="error-message">
            <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
