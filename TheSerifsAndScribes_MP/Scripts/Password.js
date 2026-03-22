function togglePassword() {
    var passwordBox = document.getElementById('password');
    var toggle = document.getElementById('showPasswordToggle');

    if (!passwordBox || !toggle) return;

    passwordBox.type = toggle.checked ? 'text' : 'password';
}