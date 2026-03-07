<#import "spring.ftl" as spring>
<#import "layout.ftlh" as layout>

<@layout.page title="">
    <div class="content-card payment-container">
        <h1 class="page-title">📱 <@spring.message "payment.page.title"/></h1>

        <#if success??>
            <div class="alert alert-success">
                <@spring.message "payment.success"/>
            </div>
        </#if>

        <#if error??>
            <div class="alert alert-danger">
                <#if error == "Provider not found">
                    <@spring.message "payment.error.provider.notfound"/>
                <#elseif error == "Provider account not found">
                    <@spring.message "payment.error.account.notfound"/>
                <#elseif error == "Insufficient funds">
                    <@spring.message "payment.error.insufficient.funds"/>
                <#elseif error == "Invalid amount">
                    <@spring.message "payment.error.invalid.amount"/>
                <#else>
                    <@spring.messageArgs "payment.error", [error] />
                </#if>
            </div>
        </#if>

        <form action="/payment" method="post" class="payment-form">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="form-group">
                <label for="providerId">🏢 <@spring.message "payment.provider.label"/></label>
                <select id="providerId" name="providerId" required>
                    <option value=""><@spring.message "payment.provider.placeholder"/></option>
                    <#list providers as provider>
                        <option value="${provider.id}">${provider.name}</option>
                    </#list>
                </select>
            </div>

            <div class="form-group">
                <label for="accountNumber">🔢 <@spring.message "payment.account.label"/></label>
                <input type="text" id="accountNumber" name="accountNumber"
                       placeholder="<@spring.message "payment.account.placeholder"/>"
                       value="${accountNumber!''}" required>
            </div>

            <div class="form-group">
                <label for="amount">💵 <@spring.message "payment.amount.label"/></label>
                <input type="number" id="amount" name="amount"
                       placeholder="<@spring.message "payment.amount.placeholder"/>"
                       min="1" step="0.01" value="${amount!''}" required>
            </div>

            <button type="submit" class="btn btn-primary payment-submit">
                <@spring.message "payment.submit"/>
            </button>
        </form>

        <div class="payment-footer">
            <a href="/profile" class="back-link">
                <@spring.message "payment.back.profile"/>
            </a>
        </div>
    </div>
</@layout.page>