<#import "spring.ftl" as spring>
<#macro page title>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>${title} | MoneyTransferApp</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/static/css/style.css">

    </head>
    <body>

    <header class="header">
        <div class="header-content">
            <div class="logo">
                <a href="/">
                    <span>💰</span> MoneyTransferApp
                </a>
            </div>

            <nav class="nav-menu">

                <div class="language-switcher">
                    <#if .lang?string == "ru">
                        <a href="?lang=en" class="lang-btn">🇬🇧 English</a>
                    <#else>
                        <a href="?lang=ru" class="lang-btn">🇷🇺 Русский</a>
                    </#if>
                </div>


                <#if isAuthenticated?? && isAuthenticated>
                    <a href="/profile">Профиль</a>
                    <a href="/transfer">Переводы</a>
                    <a href="/payment">Оплата услуг</a>

                    <div class="user-info">
                        <span>👤 ${username!}</span>
                        <span class="user-balance">💰 ${balance!0} сом</span>
                    </div>

                    <a href="/auth/logout" class="logout-btn">Выйти</a>
                <#else>
                    <a href="/auth/login">Вход</a>
                    <a href="/auth/register">Регистрация</a>
                </#if>
            </nav>
        </div>
    </header>


    <main class="main-content">
        <#nested>
    </main>


    <footer class="footer">
        <div class="footer-content">
            <div>
                © 2026 MoneyTransferApp. Все права защищены.
            </div>
        </div>
    </footer>
    </body>
    </html>
</#macro>