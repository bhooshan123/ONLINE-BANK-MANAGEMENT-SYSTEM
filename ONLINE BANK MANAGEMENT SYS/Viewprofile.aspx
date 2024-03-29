<%@ Page Title="" Language="C#" MasterPageFile="~/LeftSite.Master" AutoEventWireup="true" CodeBehind="Viewprofile.aspx.cs" Inherits="ONLINE_BANK_MANAGEMENT_SYS.Viewprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profile-container">
        <h2>User Profile</h2>

        <div>
            <label>Username:</label>
            <asp:Label ID="lblUsername" runat="server" Text=""></asp:Label>
        </div>

        <div>
            <label>Email:</label>
            <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
        </div>

        <div>
            <label>Gender:</label>
            <asp:Label ID="lblGender" runat="server" Text=""></asp:Label>
        </div>

        <div>
            <label>Address:</label>
            <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
        </div>

        <div>
            <label>Amount:</label>
            <asp:Label ID="lblAmount" runat="server" Text=""></asp:Label>
        </div>


    </div>
</asp:Content>
