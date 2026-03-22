function openModal(modalId) {
    document.getElementById(modalId).classList.add("show");
}

function closeModal(modalId) {
    document.getElementById(modalId).classList.remove("show");
}

/* CLICK OUTSIDE TO CLOSE */
window.addEventListener("click", function (event) {
    document.querySelectorAll(".custom-modal").forEach(function (modal) {
        if (event.target === modal) {
            modal.classList.remove("show");
        }
    });
});

function toggleManagePanel() {
    var layout = document.getElementById("adminAccountsLayout");
    var panel = document.getElementById("managePanel");

    if (!layout || !panel) return;

    layout.classList.toggle("manage-open");
    panel.classList.toggle("show");
}

function selectAdminRow(adminId, fullName, email, username, initials, rowElement) {
    var layout = document.getElementById("adminAccountsLayout");
    var panel = document.getElementById("managePanel");
    var emptyState = document.getElementById("manageEmptyState");
    var content = document.getElementById("managePanelContent");

    if (!layout || !panel || !emptyState || !content) return;

    layout.classList.add("manage-open");
    panel.classList.add("show");

    emptyState.style.display = "none";
    content.style.display = "block";

    document.getElementById("manageAvatar").textContent = initials;
    document.getElementById("manageName").textContent = fullName;
    document.getElementById("manageMeta").textContent = email + " · @" + username;
    document.getElementById("manageUsername").textContent = "@" + username;
    document.getElementById("manageEmail").textContent = email;

    var hiddenField = document.getElementById(document.querySelector("[id$='hfSelectedAdminID']").id);
    if (hiddenField) {
        hiddenField.value = adminId;
    }

    document.querySelectorAll(".admin-select-row").forEach(function (row) {
        row.classList.remove("selected");
    });

    if (rowElement) {
        rowElement.classList.add("selected");
    }
}