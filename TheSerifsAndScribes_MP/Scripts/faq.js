document.querySelectorAll('.faq-question').forEach(button => {
    button.addEventListener('click', () => {
        const item = button.parentElement;
        const answer = item.querySelector('.faq-answer');
        const isOpen = item.classList.contains('active');

        document.querySelectorAll('.faq-item').forEach(otherItem => {
            const otherAnswer = otherItem.querySelector('.faq-answer');
            otherItem.classList.remove('active');
            otherAnswer.style.maxHeight = null;
        });

        if (!isOpen) {
            item.classList.add('active');
            answer.style.maxHeight = answer.scrollHeight + "px";
        }
    });
});