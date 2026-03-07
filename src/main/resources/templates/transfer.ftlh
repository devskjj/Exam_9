<#import "layout.ftlh" as layout>

<@layout.page title="Перевод средств">
    <div class="content-card" style="max-width: 500px; margin: 0 auto;">
        <h1 class="page-title">💸 Перевод средств</h1>

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

        <form action="/transfer" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="form-group">
                <label for="targetAccountNumber">🔢 Номер счета получателя</label>
                <input type="text" id="targetAccountNumber" name="targetAccountNumber"
                       placeholder="Введите 6-значный номер" pattern="[0-9]{6}" maxlength="6" required>
                <small style="color: #999;">6-значный номер счета</small>
            </div>

            <div class="form-group">
                <label for="amount">💵 Сумма перевода (сом)</label>
                <input type="number" id="amount" name="amount"
                       placeholder="Введите сумму" min="1" step="0.01" required>
            </div>

            <button type="submit" class="btn btn-success" style="width: 100%;">Перевести</button>
        </form>

        <div style="margin-top: 20px; text-align: center;">
            <a href="/profile" style="color: #667eea;">← Вернуться в профиль</a>
        </div>
    </div>
</@layout.page>