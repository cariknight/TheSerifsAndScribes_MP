<%@ Page Title="News &amp; Events" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="NewsDashboard.aspx.cs" Inherits="TheSerifsAndScribes_MP.NewsDashboard" ValidateRequest="false" %>
<%@ Import Namespace="TheSerifsAndScribes_MP" %>

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Quill rich text editor -->
    <link href="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.snow.css" rel="stylesheet" />
    <style>
        .page-title { margin-bottom: 10px; font-family: "Roboto", sans-serif; font-weight: 800; color: #0a7d3b; }
        .page-subtitle { margin-bottom: 22px; color: #5f666f; }
        .layout { display: grid; grid-template-columns: 1.1fr 1fr; gap: 18px; }
        .card { border: 1px solid #e1e5ea; border-radius: 14px; background: #fff; box-shadow: 0 8px 16px rgba(0,0,0,0.05); }
        .card-body { padding: 18px; }
        .form-label { font-weight: 700; color: #3b434c; }
        .quill-shell { border: 1px solid #e1e5ea; border-radius: 12px; overflow: hidden; background: #fbfcfd; }
        .ql-toolbar.ql-snow { border: none; border-bottom: 1px solid #e1e5ea; background: #fff; }
        .ql-container.ql-snow { border: none; min-height: 240px; font-family: "Roboto", sans-serif; }
        .helper-text { color: #6c727a; font-size: 13px; margin-top: 6px; }
        .actions { display: flex; gap: 10px; flex-wrap: wrap; }
        .badge-status { padding: 6px 10px; border-radius: 10px; font-size: 12px; font-weight: 700; text-transform: uppercase; letter-spacing: .03em; }
        .badge-draft { background: #fff4e5; color: #b54708; }
        .badge-published { background: #e9f7ef; color: #0b8b46; }
        .badge-archived { background: #edf0f4; color: #4a5563; }
        @media (max-width: 1100px) { .layout { grid-template-columns: 1fr; } }
    </style>
</asp:Content>

<asp:Content ID="Content" ContentPlaceHolderID="DashboardContent" runat="server">
    <h1 class="page-title">News &amp; Events</h1>
    <p class="page-subtitle">Publish rich news stories or event highlights with author credit.</p>

    <asp:Panel ID="MessagePanel" runat="server" Visible="false" CssClass="alert" />

    <div class="layout">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title mb-3">Create article</h5>
                <div class="mb-3">
                    <asp:Label runat="server" AssociatedControlID="TitleTextBox" CssClass="form-label" Text="Headline" />
                    <asp:TextBox runat="server" ID="TitleTextBox" CssClass="form-control" />
                </div>
                <div class="mb-3 row g-3">
                    <div class="col-md-6">
                        <asp:Label runat="server" AssociatedControlID="AuthorDropDown" CssClass="form-label" Text="Author" />
                        <asp:DropDownList runat="server" ID="AuthorDropDown" CssClass="form-select" />
                    </div>
                    <div class="col-md-6">
                        <asp:Label runat="server" AssociatedControlID="CategoryDropDown" CssClass="form-label" Text="Type" />
                        <asp:DropDownList runat="server" ID="CategoryDropDown" CssClass="form-select">
                            <asp:ListItem Text="News" Value="News" />
                            <asp:ListItem Text="Event" Value="Event" />
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label" for="editor">Story content</label>
                    <div class="quill-shell">
                        <!-- Create the editor container -->
                        <div id="editor">
                            <p>Hello World!</p>
                            <p>Some initial <strong>bold</strong> text</p>
                            <p><br /></p>
                        </div>
                    </div>
                    <div class="helper-text">Use the toolbar to format. Content is stored exactly as shown.</div>
                    <asp:HiddenField runat="server" ID="ContentHtml" />
                </div>

                <div class="actions">
                    <asp:Button runat="server" ID="SaveDraftButton" CssClass="btn btn-outline-secondary" Text="Save as draft" OnClientClick="return syncEditor();" OnClick="SaveDraftButton_Click" />
                    <asp:Button runat="server" ID="PublishButton" CssClass="btn btn-success" Text="Publish" OnClientClick="return syncEditor();" OnClick="PublishButton_Click" />
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h5 class="card-title mb-0">Articles</h5>
                    <small class="text-muted">Drafts, published, and archived</small>
                </div>
                <asp:GridView runat="server" ID="NewsGrid" AutoGenerateColumns="False" CssClass="table table-hover align-middle mb-0" DataKeyNames="Id" OnRowCommand="NewsGrid_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="Category" HeaderText="Type" />
                        <asp:BoundField DataField="AuthorName" HeaderText="Author" />
                        <asp:BoundField DataField="CreatedAt" HeaderText="Created" DataFormatString="{0:MMM dd, yyyy}" />
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <span class='<%# GetStatusBadgeClass(Eval("Status")) %>'><%# GetStatusLabel(Eval("Status")) %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" CommandName="publish" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-success me-1" Visible='<%# AsStatus(Eval("Status")) != NewsStatus.Published %>'>
                                    Publish
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" CommandName="unpublish" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-outline-secondary me-1" Visible='<%# AsStatus(Eval("Status")) == NewsStatus.Published %>'>
                                    Move to draft
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" CommandName="archive" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-outline-dark me-1" Visible='<%# AsStatus(Eval("Status")) != NewsStatus.Archived %>'>
                                    Archive
                                </asp:LinkButton>
                        <asp:HyperLink runat="server" CssClass="btn btn-sm btn-outline-primary me-1" NavigateUrl='<%# "~/News.aspx#"+ Eval("Id") %>'>
                            View
                        </asp:HyperLink>
                                <asp:LinkButton runat="server" CommandName="delete" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-outline-danger" OnClientClick="return confirm('Delete this article?');">
                                    Delete
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

    <!-- Include the Quill library -->
    <script src="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.js"></script>
    <script type="text/javascript">
        let quill;
        const hiddenFieldId = '<%= ContentHtml.ClientID %>';

        function syncEditor() {
            if (!quill) return true;
            const hidden = document.getElementById(hiddenFieldId);
            if (hidden) {
                hidden.value = quill.root.innerHTML;
            }
            return true;
        }

        document.addEventListener('DOMContentLoaded', function () {
            quill = new Quill('#editor', {
                theme: 'snow'
            });

            const hidden = document.getElementById(hiddenFieldId);
            if (hidden && hidden.value) {
                quill.root.innerHTML = hidden.value;
            }
        });
    </script>
</asp:Content>
