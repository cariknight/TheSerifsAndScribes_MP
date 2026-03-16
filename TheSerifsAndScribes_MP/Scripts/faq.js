document.querySelectorAll('.faq-question').forEach(button => {
    button.addEventListener('click', () => {
        const answer = button.nextElementSibling;
        const arrow = button.querySelector('.arrow');

        document.querySelectorAll('.faq-answer').forEach(a => {
            if (a !== answer) {
                a.classList.remove('show');
                a.previousElementSibling.querySelector('.arrow').textContent = "+";
            }
        });

        answer.classList.toggle('show');
        arrow.textContent = answer.classList.contains('show') ? "−" : "+";
    });
});