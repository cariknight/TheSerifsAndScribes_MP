<%@ Page Title="Admins" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="Admins.aspx.cs" Inherits="TheSerifsAndScribes_MP.Admins" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Styles/AdminsStyle.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="DashboardContent" runat="server">

    <asp:Panel ID="NotificationBar" runat="server" CssClass="notification-bar" Visible="false" aria-live="polite">
        <span class="notification-icon" aria-hidden="true">
            <asp:Literal ID="NotificationIcon" runat="server" />
        </span>
        <span class="notification-message">
            <asp:Literal ID="NotificationMessage" runat="server" />
        </span>
        <button type="button" class="notification-close" onclick="this.closest('.notification-bar').style.display='none'; return false;" aria-label="Dismiss notification">&times;</button>
    </asp:Panel>

    <!-- MY ACCOUNT -->
    <section class="admin-section">
        <div class="section-header">
            <h1>My Account</h1>

            <div class="section-actions">
                <asp:Button ID="btnEditInfo" runat="server" Text="Edit Info" CssClass="btn-outline" OnClientClick="openModal('editInfoModal'); return false;" />
                <asp:Button ID="btnChangePassword" runat="server" Text="Change password" CssClass="btn-fill" OnClientClick="openModal('changePasswordModal'); return false;" />
            </div>
        </div>

        <div class="account-card">
            <div class="account-grid">
                <div class="account-item">
                    <span class="account-label">Full Name</span>
                    <asp:Label ID="lblFullName" runat="server" CssClass="account-value"></asp:Label>
                </div>

                <div class="account-item">
                    <span class="account-label">Username</span>
                    <asp:Label ID="lblUsername" runat="server" CssClass="account-value"></asp:Label>
                </div>

                <div class="account-item">
                    <span class="account-label">Email</span>
                    <asp:Label ID="lblEmail" runat="server" CssClass="account-value"></asp:Label>
                </div>
            </div>
        </div>
    </section>

    <!-- ADMIN ACCOUNTS -->
    <section class="admin-section">
        <div class="section-header">
            <h1>Admin Accounts</h1>

            <div class="section-actions">
                <asp:Button ID="btnManage" runat="server" Text="Manage" CssClass="btn-outline"
                    OnClientClick="toggleManagePanel(); return false;" />
                <asp:Button ID="btnAddAdmin" runat="server" Text="Add +" CssClass="btn-fill"
                    OnClientClick="openModal('addAdminModal'); return false;" />
            </div>
        </div>

        <div class="admin-accounts-layout" id="adminAccountsLayout">

            <!-- LEFT -->
            <div class="table-card admin-list-card">
                <div class="admin-table-head">
                    <div>Admin Details</div>
                </div>

                <asp:Repeater ID="rptAdmins" runat="server">
                    <ItemTemplate>
                        <div class="admin-table-row admin-select-row"
                             onclick='selectAdminRow(
                                "<%# Eval("adminID") %>",
                                "<%# (Eval("firstName").ToString() + " " + Eval("lastName").ToString()).Replace("\"", "&quot;") %>",
                                "<%# Eval("email").ToString().Replace("\"", "&quot;") %>",
                                "<%# Eval("username").ToString().Replace("\"", "&quot;") %>",
                                "<%# GetInitials(Eval("firstName"), Eval("lastName")) %>",
                                this
                             )'>

                            <div class="admin-cell admin-details">
                                <div class="admin-avatar">
                                    <%# GetInitials(Eval("firstName"), Eval("lastName")) %>
                                </div>

                                <div class="admin-text">
                                    <div class="admin-name">
                                        <%# Eval("firstName") %> <%# Eval("lastName") %>
                                    </div>
                                    <div class="admin-meta">
                                        <%# Eval("email") %> · @<%# Eval("username") %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:Panel ID="pnlEmpty" runat="server" CssClass="table-empty" Visible="false">
                    No admin accounts found.
                </asp:Panel>
            </div>

            <!-- RIGHT -->
            <div id="managePanel" class="manage-panel">
                <div id="manageEmptyState" class="manage-empty">
                    Select an admin to manage.
                </div>

                <div id="managePanelContent" class="manage-content" style="display:none;">
                    <div class="manage-profile">
                        <div id="manageAvatar" class="manage-avatar">SA</div>

                        <div class="manage-profile-text">
                            <div id="manageName" class="manage-name">System Administrator</div>
                            <div id="manageMeta" class="manage-meta">admin@binan.gov.ph · @admin1</div>
                        </div>
                    </div>

                    <div class="manage-info-list">
                        <div class="manage-info-item">
                            <span class="manage-label">Username</span>
                            <span id="manageUsername" class="manage-value">admin1</span>
                        </div>

                        <div class="manage-info-item">
                            <span class="manage-label">Email</span>
                            <span id="manageEmail" class="manage-value">admin@binan.gov.ph</span>
                        </div>
                    </div>

                    <asp:HiddenField ID="hfSelectedAdminID" runat="server" />

                    <div class="manage-actions">
                        <asp:Button ID="btnDeleteAdmin" runat="server" Text="Delete Admin" CssClass="btn-danger manage-action-btn"
                            OnClientClick="return confirm('Are you sure you want to delete this admin?');"
                            OnClick="btnDeleteAdmin_Click" />
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CHANGE PASSWORD MODAL -->
    <div id="changePasswordModal" class="custom-modal">
        <div class="custom-modal-card">

            <button type="button" class="custom-modal-close" onclick="closeModal('changePasswordModal')">
                &times;
            </button>

            <div class="custom-modal-title">Change Password</div>

            <div class="custom-form-group">
                <label class="custom-label">Current Password</label>
                <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="custom-input password-field" TextMode="Password" />
            </div>

            <div class="custom-form-group">
                <label class="custom-label">New Password</label>
                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="custom-input password-field" TextMode="Password" />
            </div>

            <div class="custom-form-group">
                <label class="custom-label">Confirm New Password</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="custom-input password-field" TextMode="Password" />
            </div>

            <div class="custom-show-password-wrap">
                <input type="checkbox" id="showChangePasswordToggle" onclick="togglePasswordGroup('showChangePasswordToggle', 'password-field')" />
                <label for="showChangePasswordToggle" class="custom-show-password-label">Show Password</label>
            </div>

            <asp:Label ID="lblChangePasswordMessage" runat="server" CssClass="custom-error" Visible="false"></asp:Label>

            <div class="custom-button-stack">
                <asp:Button ID="btnSavePassword" runat="server" Text="Update Password" CssClass="custom-btn-fill" OnClick="btnSavePassword_Click" />
                <button type="button" class="custom-btn-outline" onclick="closeModal('changePasswordModal')">Cancel</button>
            </div>

        </div>
    </div>

    <!-- EDIT INFO MODAL -->
    <div id="editInfoModal" class="custom-modal">
        <div class="custom-modal-card">

            <button type="button" class="custom-modal-close" onclick="closeModal('editInfoModal')">
                &times;
            </button>

            <div class="custom-modal-title">Edit Info</div>

            <div class="custom-form-group">
                <label class="custom-label">First Name</label>
                <asp:TextBox ID="txtEditFirstName" runat="server" CssClass="custom-input" placeholder="Enter first name"></asp:TextBox>
            </div>

            <div class="custom-form-group">
                <label class="custom-label">Last Name</label>
                <asp:TextBox ID="txtEditLastName" runat="server" CssClass="custom-input" placeholder="Enter last name"></asp:TextBox>
            </div>

            <div class="custom-form-group">
                <label class="custom-label">Username</label>
                <asp:TextBox ID="txtEditUsername" runat="server" CssClass="custom-input" placeholder="Enter username"></asp:TextBox>
            </div>

            <div class="custom-form-group">
                <label class="custom-label">Email</label>
                <asp:TextBox ID="txtEditEmail" runat="server" CssClass="custom-input" placeholder="Enter email"></asp:TextBox>
            </div>

            <asp:Label ID="lblEditInfoMessage" runat="server" CssClass="custom-error" Visible="false"></asp:Label>

            <div class="custom-button-stack">
                <asp:Button ID="btnSaveInfo" runat="server" Text="Save Changes" CssClass="custom-btn-fill" OnClick="btnSaveInfo_Click" />
                <button type="button" class="custom-btn-outline" onclick="closeModal('editInfoModal')">Cancel</button>
            </div>

        </div>
    </div>

    <!-- ADD ADMIN MODAL -->
    <div id="addAdminModal" class="custom-modal">
        <div class="custom-modal-card scrollable">

            <button type="button" class="custom-modal-close" onclick="closeModal('addAdminModal')">
                &times;
            </button>

            <div class="custom-modal-title">Add New Admin</div>

            <div class="custom-form-group">
                <label class="custom-label">First Name</label>
                <asp:TextBox ID="txtAddFirstName" runat="server" CssClass="custom-input" placeholder="Enter first name"></asp:TextBox>
            </div>

            <div class="custom-form-group">
                <label class="custom-label">Last Name</label>
                <asp:TextBox ID="txtAddLastName" runat="server" CssClass="custom-input" placeholder="Enter last name"></asp:TextBox>
            </div>

            <div class="custom-form-group">
                <label class="custom-label">Username</label>
                <asp:TextBox ID="txtAddUsername" runat="server" CssClass="custom-input" placeholder="Enter username"></asp:TextBox>
            </div>

            <div class="custom-form-group">
                <label class="custom-label">Email</label>
                <asp:TextBox ID="txtAddEmail" runat="server" CssClass="custom-input" placeholder="Enter email"></asp:TextBox>
            </div>

            <div class="custom-form-group">
                <label class="custom-label">Password</label>
                <asp:TextBox ID="txtAddPassword" runat="server" CssClass="custom-input add-password-field" TextMode="Password" placeholder="Enter password"></asp:TextBox>
            </div>

            <div class="custom-form-group">
                <label class="custom-label">Confirm Password</label>
                <asp:TextBox ID="txtAddConfirmPassword" runat="server" CssClass="custom-input add-password-field" TextMode="Password" placeholder="Confirm password"></asp:TextBox>
            </div>

            <div class="custom-show-password-wrap">
                <input type="checkbox" id="showAddAdminPasswordToggle"
                    onclick="togglePasswordGroup('showAddAdminPasswordToggle', 'add-password-field')" />
                <label for="showAddAdminPasswordToggle" class="custom-show-password-label">Show Password</label>
            </div>

            <asp:Label ID="lblAddAdminMessage" runat="server" CssClass="custom-error" Visible="false"></asp:Label>

            <div class="custom-button-stack">
                <asp:Button ID="btnCreateAdmin" runat="server" Text="Create Admin" CssClass="custom-btn-fill" OnClick="btnCreateAdmin_Click" />
                <button type="button" class="custom-btn-outline" onclick="closeModal('addAdminModal')">Cancel</button>
            </div>
        </div>
    </div>

    <script src="Scripts/Password.js"></script> 
    <script src="Scripts/modal.js"></script>
</asp:Content>
