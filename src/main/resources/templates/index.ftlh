<#import "layout.ftlh" as layout>

<@layout.page title="Главная">
    <div class="content-card">
        <h1 class="page-title">💰 Добро пожаловать в электронный кошелек</h1>

        <#if isAuthenticated>
            <div class="welcome-section">
                <h2>Здравствуйте, ${username}!</h2>
                <p class="welcome-title">Ваш текущий баланс:</p>
                <p class="balance-amount">${balance} сом</p>
            </div>

            <div class="actions-container">
                <a href="/profile" class="btn btn-primary">👤 Мой профиль</a>
                <a href="/transfer" class="btn btn-success">💸 Перевести средства</a>
                <a href="/payment" class="btn btn-primary">📱 Оплатить услуги</a>
            </div>
        <#else>
            <div class="guest-section">
                <p class="guest-description">
                    Управляйте своими финансами легко и безопасно
                </p>

                <div class="auth-buttons">
                    <a href="/auth/login" class="btn btn-primary">🔑 Войти</a>
                    <a href="/auth/register" class="btn btn-success">📝 Регистрация</a>
                </div>
            </div>
        </#if>

        <div class="features-grid">
            <div class="feature-item">
                <h3 class="feature-title">💳 Личный счет</h3>
                <p class="feature-description">Уникальный 6-значный номер счета для каждого пользователя</p>
            </div>
            <div class="feature-item">
                <h3 class="feature-title">💸 Переводы</h3>
                <p class="feature-description">Мгновенные переводы между пользователями</p>
            </div>
            <div class="feature-item">
                <h3 class="feature-title">📱 Оплата услуг</h3>
                <p class="feature-description">Оплачивайте услуги поставщиков прямо из кошелька</p>
            </div>
            <div class="feature-item">
                <h3 class="feature-title">📊 История</h3>
                <p class="feature-description">Детальная история всех транзакций</p>
            </div>
        </div>
    </div>
</@layout.page>