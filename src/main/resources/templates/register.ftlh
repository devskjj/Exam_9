<#import "layout.ftlh" as layout>

<@layout.page title="Регистрация">
    <div class="content-card" style="max-width: 500px; margin: 0 auto;">
        <h1 class="page-title">📝 Регистрация</h1>

        <#if error??>
            <div class="alert alert-danger">
                Ошибка: ${error}
            </div>
        </#if>

        <div class="alert alert-info">
            💡 После регистрации вы получите уникальный 6-значный номер счета
            и 1000 сом на баланс!
        </div>

        <form action="/auth/register" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="form-group">
                <label for="username">👤 Имя пользователя</label>
                <input type="text" id="username" name="username" placeholder="Введите ваше имя" required>
            </div>

            <div class="form-group">
                <label for="email">📧 Email</label>
                <input type="email" id="email" name="email" placeholder="example@mail.com" required>
            </div>

            <div class="form-group">
                <label for="password">🔒 Пароль</label>
                <input type="password" id="password" name="password" placeholder="Минимум 6 символов" required>
            </div>

            <div class="form-group">
                <label for="roleName">👑 Роль</label>
                <select id="roleName" name="roleName" required>
                    <option value="USER" selected>USER</option>
                </select>
            </div>

            <button type="submit" class="btn btn-success" style="width: 100%;">Зарегистрироваться</button>
        </form>

        <div style="text-align: center; margin-top: 20px;">
            <a href="/auth/login" style="color: #667eea;">Уже есть аккаунт? Войти</a>
        </div>
    </div>
</@layout.page>