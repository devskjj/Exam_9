<#import "layout.ftlh" as layout>

<@layout.page title="Вход в систему">
    <div class="content-card" style="max-width: 400px; margin: 0 auto;">
        <h1 class="page-title">🔐 Вход в кошелек</h1>

        <#if error??>
            <div class="alert alert-danger">
                ${error}
            </div>
        </#if>

        <#if registered??>
            <div class="alert alert-success">
                Регистрация успешна! Теперь вы можете войти.
            </div>
        </#if>

        <form action="/auth/login" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="form-group">
                <label for="email">📧 Email</label>
                <input type="email" id="email" name="username" placeholder="Введите ваш email" required>
            </div>

            <div class="form-group">
                <label for="password">🔒 Пароль</label>
                <input type="password" id="password" name="password" placeholder="Введите ваш пароль" required>
            </div>

            <button type="submit" class="btn btn-primary" style="width: 100%;">Войти</button>
        </form>

        <div style="text-align: center; margin-top: 20px;">
            <a href="/auth/register" style="color: #667eea;">Нет аккаунта? Зарегистрироваться</a>
        </div>
    </div>
</@layout.page>