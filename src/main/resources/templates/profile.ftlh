<#import "spring.ftl" as spring>
<#import "layout.ftlh" as layout>

<@layout.page title="">
    <div class="content-card">
        <h1 class="page-title">👤 <@spring.message "profile.page.title"/></h1>

        <div class="profile-header" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 30px; border-radius: 10px; margin-bottom: 30px;">
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px;">
                <div>
                    <div style="font-size: 14px; opacity: 0.8;"><@spring.message "profile.username.label"/></div>
                    <div style="font-size: 24px; font-weight: bold;">${profile.username}</div>
                </div>
                <div>
                    <div style="font-size: 14px; opacity: 0.8;"><@spring.message "profile.email.label"/></div>
                    <div style="font-size: 24px; font-weight: bold;">${profile.email}</div>
                </div>
                <div>
                    <div style="font-size: 14px; opacity: 0.8;"><@spring.message "profile.account.label"/></div>
                    <div style="font-size: 24px; font-weight: bold;">${profile.accountNumber}</div>
                </div>
                <div>
                    <div style="font-size: 14px; opacity: 0.8;"><@spring.message "profile.balance.label"/></div>
                    <div style="font-size: 32px; font-weight: bold;">
                        ${profile.balance} <@spring.message "currency.som"/>
                    </div>
                </div>
                <div>
                    <div style="font-size: 14px; opacity: 0.8;"><@spring.message "profile.role.label"/></div>
                    <div style="font-size: 20px;">${profile.roleName}</div>
                </div>
            </div>
        </div>

        <h2 style="margin-bottom: 20px;">📊 <@spring.message "profile.transactions.title"/></h2>

        <table>
            <thead>
            <tr>
                <th><@spring.message "transaction.table.date"/></th>
                <th><@spring.message "transaction.table.type"/></th>
                <th><@spring.message "transaction.table.amount"/></th>
                <th><@spring.message "transaction.table.counterparty"/></th>
                <th><@spring.message "transaction.table.description"/></th>
            </tr>
            </thead>
            <tbody>
            <#if profile.transactions?size == 0>
                <tr>
                    <td colspan="5" style="text-align: center;">
                        <@spring.message "profile.transactions.empty"/>
                    </td>
                </tr>
            <#else>
                <#list profile.transactions as transaction>
                    <tr>
                        <td>${transaction.date}</td>
                        <td>
                            <#if transaction.type == "TRANSFER_SENT">
                                💸 <@spring.message "transaction.type.sent"/>
                            <#elseif transaction.type == "TRANSFER_RECEIVED">
                                💰 <@spring.message "transaction.type.received"/>
                            <#elseif transaction.type == "PAYMENT">
                                📱 <@spring.message "transaction.type.payment"/>
                            <#else>
                                <@spring.messageArgs "transaction.type.default", [transaction.type] />
                            </#if>
                        </td>
                        <td style="color: ${(transaction.type == 'TRANSFER_SENT' || transaction.type == 'PAYMENT')?then('#dc3545', '#28a745')}; font-weight: bold;">
                            ${transaction.amount} <@spring.message "currency.som"/>
                        </td>
                        <td>${transaction.counterparty!'-'}</td>
                        <td>${transaction.description!'-'}</td>
                    </tr>
                </#list>
            </#if>
            </tbody>
        </table>

        <div style="text-align: center; margin-top: 30px;">
            <a href="/" class="btn btn-primary" style="margin-right: 10px;">
                ← <@spring.message "nav.home"/>
            </a>
            <a href="/transfer" class="btn btn-success" style="margin-right: 10px;">
                💸 <@spring.message "nav.transfer"/>
            </a>
            <a href="/payment" class="btn btn-primary">
                📱 <@spring.message "nav.payment"/>
            </a>
        </div>
    </div>
</@layout.page>