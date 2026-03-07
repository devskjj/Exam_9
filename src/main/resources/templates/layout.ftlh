<#import "spring.ftl" as spring>
<#macro page title>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>${title} | <@spring.message "app.name"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/static/css/style.css">
    </head>
    <body>

    <header class="header">
        <div class="header-content">
            <div class="logo">
                <a href="/">
                    <span>💰</span> <@spring.message "app.name"/>
                </a>
            </div>

            <nav class="nav-menu">


                <div class="language-switcher">
                    <#if .lang?string == "ru">
                        <a href="?lang=en" class="lang-btn" title="<@spring.message "lang.switch"/>">
                            🇬🇧 <@spring.message "lang.en"/>
                        </a>
                    <#else>
                        <a href="?lang=ru" class="lang-btn" title="<@spring.message "lang.switch"/>">
                            🇷🇺 <@spring.message "lang.ru"/>
                        </a>
                    </#if>
                </div>


                <#if isAuthenticated?? && isAuthenticated>
                    <a href="/profile"><@spring.message "nav.profile"/></a>
                    <a href="/transfer"><@spring.message "nav.transfer"/></a>
                    <a href="/payment"><@spring.message "nav.payment"/></a>

                    <div class="user-info">
                        <span>👤 <@spring.messageArgs "user.greeting", [username!] /></span>
                        <span class="user-balance">
                            💰 <@spring.messageArgs "user.balance", [balance!0] />
                        </span>
                    </div>

                    <a href="/auth/logout" class="logout-btn"><@spring.message "nav.logout"/></a>


                <#else>
                    <a href="/auth/login"><@spring.message "nav.login"/></a>
                    <a href="/auth/register"><@spring.message "nav.register"/></a>
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
                <@spring.message "footer.copyright"/>
            </div>
        </div>
    </footer>

    </body>
    </html>
</#macro>