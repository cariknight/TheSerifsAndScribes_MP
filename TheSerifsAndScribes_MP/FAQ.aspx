<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="TheSerifsAndScribes_MP.FAQ" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FAQs</title>
    <link href="~/Styles/faq.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="faq-wrapper">
            <h2>Frequently Asked Questions</h2>
            <p>Do you have more questions? Send us a message!</p>
        </div>

        <div class="faq-section">
            <div class="faq-item">
                <button type="button" class="faq-question">
                    How can I request a copy of my birth, marriage, or death certificate?
                    <span class="arrow">+</span>
                </button>
                <div class="faq-answer">
                    You may request civil registry documents at the City Civil Registrar’s Office in Biñan City Hall. 
                    Please bring valid identification and the required processing fee.
                </div>
            </div>

            <div class="faq-item">
                <button type="button" class="faq-question">
                    Where do I apply for or renew a business permit?
                    <span class="arrow">+</span>
                </button>
                <div class="faq-answer">
                    Applications and renewals are handled by the Business Permit and Licensing Office (BPLO). 
                    Forms are available at City Hall or through the Services section of our website.
                </div>
            </div>

            <div class="faq-item">
                <button type="button" class="faq-question">
                    What is the official emergency hotline number?
                    <span class="arrow">+</span>
                </button>
                <div class="faq-answer">
                    For urgent concerns, please call our official hotline: (049) 513-9111.
                </div>
            </div>

            <div class="faq-item">
                <button type="button" class="faq-question">
                    How do I apply for government jobs in Biñan City?
                    <span class="arrow">+</span>
                </button>
                <div class="faq-answer">
                    Job openings are posted on the Jobs/Careers section of our website and at the City Human Resources Office. 
                    Applicants must submit their résumé and required documents.
                </div>
            </div>

            <div class="faq-item">
                <button type="button" class="faq-question">
                    How do I apply for medical, educational, or livelihood assistance?
                    <span class="arrow">+</span>
                </button>
                <div class="faq-answer">
                    Assistance programs are managed by the City Social Welfare and Development Office (CSWDO). 
                    Please visit their office or contact them through the hotline for requirements and application procedures.
                </div>
            </div>
        </div>
    </form>

    <script>
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
    </script>
</body>
</html>