<%@ Page Title="Inquiries" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="Inquiries.aspx.cs" Inherits="TheSerifsAndScribes_MP.Inquiries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .inquiries-header { display: flex; align-items: center; justify-content: space-between; gap: 12px; margin-bottom: 18px; }
        .inquiries-header h1 { margin: 0; font-family: "Roboto", sans-serif; font-weight: 800; color: #0a7d3b; }
        .inquiries-shell { display: grid; gap: 14px; }
        .inquiry-card { background: #fff; border: 1px solid #e3e6ea; border-radius: 12px; padding: 16px; box-shadow: 0 6px 14px rgba(0,0,0,0.06); }
        .inquiry-top { display: flex; flex-wrap: wrap; justify-content: space-between; gap: 10px; }
        .inquiry-meta { display: flex; flex-wrap: wrap; gap: 8px 16px; align-items: center; }
        .meta-pill { background: #f4f7fa; border-radius: 999px; padding: 6px 12px; font-weight: 600; color: #3b434c; }
        .meta-pill .label { color: #6b7280; font-weight: 500; margin-right: 6px; }
        .badge { display: inline-flex; align-items: center; padding: 6px 12px; border-radius: 999px; font-size: 12px; font-weight: 800; text-transform: uppercase; letter-spacing: .03em; }
        .badge-unread { background: #ffe8e6; color: #c2412d; }
        .badge-read { background: #e6f4ff; color: #0b5394; }
        .badge-replied { background: #e7f6e7; color: #146c2e; }
        .badge-archived { background: #f1f1f1; color: #555; }
        .inquiry-body { margin: 12px 0; color: #3b434c; line-height: 1.55; }
        .inquiry-subject { font-weight: 700; color: #0a7d3b; margin-bottom: 6px; }
        .actions { display: flex; flex-wrap: wrap; gap: 8px; }
        .actions .btn { border-radius: 10px; }
        .empty-state { padding: 24px; text-align: center; color: #6c727a; border: 1px dashed #d6d9de; border-radius: 12px; background: #fbfcfd; }
        .contact-link { text-decoration: none; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="DashboardContent" runat="server">
    <div class="inquiries-header">
        <h1>Inquiries</h1>
        <a href="~/Contact.aspx" runat="server" class="btn btn-outline-success btn-sm contact-link">Go to Contact Form</a>
    </div>

    <asp:Panel ID="PanelEmpty" runat="server" CssClass="empty-state" Visible="false">
        No inquiries found.
    </asp:Panel>

    <div class="inquiries-shell">
        <asp:Repeater ID="RepeaterInquiries" runat="server" OnItemCommand="RepeaterInquiries_ItemCommand" OnItemDataBound="RepeaterInquiries_ItemDataBound">
            <ItemTemplate>
                <div class="inquiry-card">
                    <div class="inquiry-top">
                        <div class="inquiry-meta">
                            <span class="meta-pill"><span class="label">From:</span><%# Eval("fullName") %></span>
                            <span class="meta-pill"><span class="label">Email:</span><%# Eval("email") %></span>
                            <asp:Label runat="server" Visible='<%# !string.IsNullOrWhiteSpace(Eval("phoneNumber") as string) %>' CssClass="meta-pill">
                                <span class="label">Phone:</span><%# Eval("phoneNumber") %>
                            </asp:Label>
                            <span class="meta-pill"><span class="label">Sent:</span><%# Eval("dateSent", "{0:yyyy-MM-dd}") %></span>
                        </div>
                        <span class="badge" runat="server" id="StatusBadge"><%# Eval("status") %></span>
                    </div>

                    <div class="inquiry-body">
                        <div class="inquiry-subject"><%# string.IsNullOrWhiteSpace(Eval("subject") as string) ? "(No subject)" : Eval("subject") %></div>
                        <asp:Literal ID="LiteralMessage" runat="server" Text='<%# Eval("message") %>' />
                    </div>

                    <div class="actions">
                        <asp:LinkButton runat="server" CommandName="Reply" CommandArgument='<%# Eval("messageID") %>' CssClass="btn btn-success btn-sm" OnClientClick='<%# BuildMailtoOnClick(Eval("email"), Eval("subject"), Eval("fullName")) %>'>
                            <i class="fa-regular fa-paper-plane"></i> Reply
                        </asp:LinkButton>
                        <asp:LinkButton runat="server" CommandName="MarkRead" CommandArgument='<%# Eval("messageID") %>' CssClass="btn btn-outline-primary btn-sm">Mark as Read</asp:LinkButton>
                        <asp:LinkButton runat="server" CommandName="MarkUnread" CommandArgument='<%# Eval("messageID") %>' CssClass="btn btn-outline-secondary btn-sm">Mark as Unread</asp:LinkButton>
                        <asp:LinkButton runat="server" CommandName="MarkArchived" CommandArgument='<%# Eval("messageID") %>' CssClass="btn btn-outline-dark btn-sm">Archive</asp:LinkButton>
                        <asp:LinkButton runat="server" CommandName="DeleteRow" CommandArgument='<%# Eval("messageID") %>' CssClass="btn btn-outline-danger btn-sm" OnClientClick="return confirm('Delete this message?');">Delete</asp:LinkButton>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
