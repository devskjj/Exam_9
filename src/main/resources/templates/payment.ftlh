<#import "layout.ftlh" as layout>

<@layout.page title="Оплата услуг">
    <div class="content-card" style="max-width: 500px; margin: 0 auto;">
        <h1 class="page-title">📱 Оплата услуг</h1>

        <#if success??>
            <div class="alert alert-success">
                ${success}
            </div>
        </#if>

        <#if error??>
            <div class="alert alert-danger">
                ${error}
            </div>
        </#if>

        <form action="/payment" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="form-group">
                <label for="providerId">🏢 Поставщик услуг</label>
                <select id="providerId" name="providerId" required>
                    <option value="">Выберите поставщика</option>
                    <#list providers as provider>
                        <option value="${provider.id}">${provider.name}</option>
                    </#list>
                </select>
            </div>

            <div class="form-group">
                <label for="accountNumber">🔢 Лицевой счет</label>
                <input type="text" id="accountNumber" name="accountNumber"
                       placeholder="Введите номер лицевого счета" required>
            </div>

            <div class="form-group">
                <label for="amount">💵 Сумма платежа (сом)</label>
                <input type="number" id="amount" name="amount"
                       placeholder="Введите сумму" min="1" step="0.01" required>
            </div>

            <button type="submit" class="btn btn-primary" style="width: 100%;">Оплатить</button>
        </form>

        <div style="margin-top: 20px; text-align: center;">
            <a href="/profile" style="color: #667eea;">← Вернуться в профиль</a>
        </div>
    </div>
</@layout.page>