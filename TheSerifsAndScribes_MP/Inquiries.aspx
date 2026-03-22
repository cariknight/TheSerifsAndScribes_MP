<%@ Page Title="Inquiries" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="Inquiries.aspx.cs" Inherits="TheSerifsAndScribes_MP.Inquiries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .inquiries-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 18px;
        }
        .inquiries-header h2 {
            margin: 0;
            font-family: "Akatab Bold", "Roboto", sans-serif;
            color: #0a7d3b;
        }
        .inquiries-table {
            width: 100%;
            background: #ffffff;
            border: 1px solid #e3e6ea;
            border-radius: 12px;
            box-shadow: 0 6px 14px rgba(0,0,0,0.06);
            padding: 12px;
        }
        .inquiries-table .grid th {
            background: #f4f7fa;
            color: #3b434c;
            font-weight: 700;
            padding: 10px;
        }
        .inquiries-table .grid td {
            padding: 10px;
            vertical-align: top;
        }
        .badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 999px;
            font-size: 12px;
            font-weight: 700;
        }
        .badge-unread { background: #ffe8e6; color: #c2412d; }
        .badge-read { background: #e6f4ff; color: #0b5394; }
        .badge-replied { background: #e7f6e7; color: #146c2e; }
        .badge-archived { background: #f1f1f1; color: #666; }
        .actions button {
            margin: 0 4px 4px 0;
        }
        .empty-state {
            padding: 24px;
            text-align: center;
            color: #6c727a;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="DashboardContent" runat="server">
    <div class="inquiries-header">
        <h2>Inquiries</h2>
        <a href="~/Contact.aspx" runat="server" class="btn btn-outline-success btn-sm">Go to Contact Form</a>
    </div>

    <div class="inquiries-table">
        <asp:GridView ID="GridInquiries" runat="server" CssClass="table table-hover grid"
            AutoGenerateColumns="False" DataKeyNames="messageID" OnRowCommand="GridInquiries_RowCommand" OnRowDataBound="GridInquiries_RowDataBound">
            <Columns>
                <asp:BoundField DataField="messageID" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="fullName" HeaderText="Name" />
                <asp:BoundField DataField="email" HeaderText="Email" />
                <asp:BoundField DataField="phoneNumber" HeaderText="Phone" />
                <asp:BoundField DataField="message" HeaderText="Message" />
                <asp:BoundField DataField="dateSent" HeaderText="Sent" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <span class="badge" runat="server" id="StatusBadge"><%# Eval("status") %></span>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <div class="actions">
                            <asp:LinkButton runat="server" CommandName="MarkRead" CommandArgument='<%# Eval("messageID") %>' CssClass="btn btn-sm btn-outline-primary">Read</asp:LinkButton>
                            <asp:LinkButton runat="server" CommandName="MarkUnread" CommandArgument='<%# Eval("messageID") %>' CssClass="btn btn-sm btn-outline-secondary">Unread</asp:LinkButton>
                            <asp:LinkButton runat="server" CommandName="MarkReplied" CommandArgument='<%# Eval("messageID") %>' CssClass="btn btn-sm btn-outline-success">Replied</asp:LinkButton>
                            <asp:LinkButton runat="server" CommandName="MarkArchived" CommandArgument='<%# Eval("messageID") %>' CssClass="btn btn-sm btn-outline-dark">Archive</asp:LinkButton>
                            <asp:LinkButton runat="server" CommandName="DeleteRow" CommandArgument='<%# Eval("messageID") %>' CssClass="btn btn-sm btn-outline-danger" OnClientClick="return confirm('Delete this message?');">Delete</asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <div class="empty-state">No inquiries found.</div>
            </EmptyDataTemplate>
        </asp:GridView>
    </div>
</asp:Content>
