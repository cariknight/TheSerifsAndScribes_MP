document.querySelectorAll('.faq-question').forEach(button => {
    button.addEventListener('click', () => {
        const item = button.parentElement;
        const answer = item.querySelector('.faq-answer');

        if (item.classList.contains('active')) {
            // CLOSE
            answer.style.maxHeight = null;
            item.classList.remove('active');
        } else {
            // OPEN
            item.classList.add('active');
            answer.style.maxHeight = answer.scrollHeight + 'px';
        }
    });
});

document.querySelectorAll('.faq-support-option').forEach(card => {
    const img = card.querySelector('img');
    const original = img.src;
    const hover = img.getAttribute('data-hover');

    card.addEventListener('mouseenter', () => {
        if (hover) img.src = hover;
    });

    card.addEventListener('mouseleave', () => {
        img.src = original;
    });
});

document.addEventListener("DOMContentLoaded", function () {
    const buttons = document.querySelectorAll(".faq-filter");
    const items = document.querySelectorAll(".faq-item");

    buttons.forEach(btn => {
        btn.addEventListener("click", () => {

            buttons.forEach(b => b.classList.remove("active"));
            btn.classList.add("active");

            const filter = btn.getAttribute("data-filter");

            items.forEach(item => {
                const category = item.getAttribute("data-category");

                if (filter === "all" || category === filter) {
                    item.style.display = "block";
                } else {
                    item.style.display = "none";
                }
            });
        });
    });
});