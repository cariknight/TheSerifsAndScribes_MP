function togglePassword() {
    var passwordBox = document.getElementById('password');
    var toggle = document.getElementById('showPasswordToggle');

    if (!passwordBox || !toggle) return;

    passwordBox.type = toggle.checked ? 'text' : 'password';
}

function togglePasswordGroup(checkboxId, inputClass) {
    var toggle = document.getElementById(checkboxId);
    if (!toggle) return;

    var inputs = document.querySelectorAll("." + inputClass);
    var type = toggle.checked ? "text" : "password";

    inputs.forEach(function (input) {
        input.type = type;
    });
}