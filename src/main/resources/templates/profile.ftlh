<#import "layout.ftlh" as layout>

<@layout.page title="Мой профиль">
    <div class="content-card">
        <h1 class="page-title">👤 Мой профиль</h1>

        <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 30px; border-radius: 10px; margin-bottom: 30px;">
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px;">
                <div>
                    <div style="font-size: 14px; opacity: 0.8;">Имя пользователя</div>
                    <div style="font-size: 24px; font-weight: bold;">${profile.username}</div>
                </div>
                <div>
                    <div style="font-size: 14px; opacity: 0.8;">Email</div>
                    <div style="font-size: 24px; font-weight: bold;">${profile.email}</div>
                </div>
                <div>
                    <div style="font-size: 14px; opacity: 0.8;">Номер счета</div>
                    <div style="font-size: 24px; font-weight: bold;">${profile.accountNumber}</div>
                </div>
                <div>
                    <div style="font-size: 14px; opacity: 0.8;">Баланс</div>
                    <div style="font-size: 32px; font-weight: bold;">${profile.balance} сом</div>
                </div>
                <div>
                    <div style="font-size: 14px; opacity: 0.8;">Роль</div>
                    <div style="font-size: 20px;">${profile.roleName}</div>
                </div>
            </div>
        </div>

        <h2 style="margin-bottom: 20px;">📊 История транзакций</h2>

        <table>
            <thead>
            <tr>
                <th>Дата</th>
                <th>Тип</th>
                <th>Сумма</th>
                <th>Контрагент</th>
                <th>Описание</th>
            </tr>
            </thead>
            <tbody>
            <#if profile.transactions?size == 0>
                <tr>
                    <td colspan="5" style="text-align: center;">Нет транзакций</td>
                </tr>
            <#else>
                <#list profile.transactions as transaction>
                    <tr>
                        <td>${transaction.date}</td>
                        <td>
                            <#if transaction.type == "TRANSFER_SENT">💸 Исходящий перевод
                            <#elseif transaction.type == "TRANSFER_RECEIVED">💰 Входящий перевод
                            <#elseif transaction.type == "PAYMENT">📱 Оплата услуг
                            <#else>${transaction.type}
                            </#if>
                        </td>
                        <td style="color: ${(transaction.type == 'TRANSFER_SENT' || transaction.type == 'PAYMENT')?then('#dc3545', '#28a745')}; font-weight: bold;">
                            ${transaction.amount} сом
                        </td>
                        <td>${transaction.counterparty!'-'}</td>
                        <td>${transaction.description!'-'}</td>
                    </tr>
                </#list>
            </#if>
            </tbody>
        </table>
    </div>
</@layout.page>