<#import "spring.ftl" as spring>
<#import "layout.ftlh" as layout>

<@layout.page title="">
    <div class="content-card">
        <h1 class="page-title">💰 <@spring.message "app.title"/></h1>

        <#if isAuthenticated>
            <div class="welcome-section">
                <h2><@spring.messageArgs "user.greeting", [username!] /></h2>
                <p class="welcome-title"><@spring.message "balance.current"/></p>
                <p class="balance-amount">
                    <@spring.messageArgs "user.balance", [balance!0] />
                </p>
            </div>

            <div class="actions-container">
                <a href="/profile" class="btn btn-primary">👤 <@spring.message "nav.profile"/></a>
                <a href="/transfer" class="btn btn-success">💸 <@spring.message "nav.transfer"/></a>
                <a href="/payment" class="btn btn-primary">📱 <@spring.message "nav.payment"/></a>
            </div>
        <#else>
            <div class="guest-section">
                <p class="guest-description">
                    <@spring.message "home.welcome"/>
                </p>

                <div class="auth-buttons">
                    <a href="/auth/login" class="btn btn-primary">🔑 <@spring.message "nav.login"/></a>
                    <a href="/auth/register" class="btn btn-success">📝 <@spring.message "nav.register"/></a>
                </div>
            </div>
        </#if>

        <div class="features-grid">
            <div class="feature-item">
                <h3 class="feature-title">💳 <@spring.message "feature.account.title"/></h3>
                <p class="feature-description"><@spring.message "feature.account.desc"/></p>
            </div>
            <div class="feature-item">
                <h3 class="feature-title">💸 <@spring.message "feature.transfer.title"/></h3>
                <p class="feature-description"><@spring.message "feature.transfer.desc"/></p>
            </div>
            <div class="feature-item">
                <h3 class="feature-title">📱 <@spring.message "feature.payment.title"/></h3>
                <p class="feature-description"><@spring.message "feature.payment.desc"/></p>
            </div>
            <div class="feature-item">
                <h3 class="feature-title">📊 <@spring.message "feature.history.title"/></h3>
                <p class="feature-description"><@spring.message "feature.history.desc"/></p>
            </div>
        </div>
    </div>
</@layout.page>