<#import "spring.ftl" as spring>
<#import "layout.ftlh" as layout>

<@layout.page title="">
    <div class="content-card transfer-container">
        <h1 class="page-title">💸 <@spring.message "transfer.page.title"/></h1>

        <#if success??>
            <div class="alert alert-success">
                <@spring.message "transfer.success"/>
            </div>
        </#if>

        <#if error??>
            <div class="alert alert-danger">
                <#if error == "Cannot transfer to yourself">
                    <@spring.message "transfer.error.self"/>
                <#elseif error == "Insufficient funds">
                    <@spring.message "transfer.error.insufficient.funds"/>
                <#elseif error == "Invalid amount">
                    <@spring.message "transfer.error.invalid.amount"/>
                <#elseif error == "Account not found">
                    <@spring.message "transfer.error.account.notfound"/>
                <#else>
                    <@spring.messageArgs "transfer.error", [error] />
                </#if>
            </div>
        </#if>

        <div class="current-balance-info">
            <p><@spring.message "balance.current"/> <strong>${balance!0} <@spring.message "currency.som"/></strong></p>
        </div>

        <form action="/transfer" method="post" class="transfer-form">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="form-group">
                <label for="targetAccountNumber">🔢 <@spring.message "transfer.account.label"/></label>
                <input type="text" id="targetAccountNumber" name="targetAccountNumber"
                       placeholder="<@spring.message "transfer.account.placeholder"/>"
                        maxlength="6" value="${targetAccount!''}">
                <small class="form-hint"><@spring.message "transfer.account.hint"/></small>
            </div>

            <div class="form-group">
                <label for="amount">💵 <@spring.message "transfer.amount.label"/></label>
                <input type="number" id="amount" name="amount"
                       placeholder="<@spring.message "transfer.amount.placeholder"/>"
                       step="0.01" value="${amount!''}" >
                <small class="form-hint"><@spring.message "transfer.amount.hint"/></small>
            </div>

            <button type="submit" class="btn btn-success transfer-submit">
                <@spring.message "transfer.submit"/>
            </button>
        </form>

        <div class="transfer-footer">
            <a href="/profile" class="back-link">
                <@spring.message "transfer.back.profile"/>
            </a>
        </div>
    </div>
</@layout.page>