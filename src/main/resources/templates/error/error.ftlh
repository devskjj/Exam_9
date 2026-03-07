<#import "/spring.ftl" as spring>
<#import "../layout.ftlh" as layout>

<@layout.page title="">
    <div class="error-page">
        <div class="error-content">
            <h1 class="error-code">${status!500}</h1>
            <h2 class="error-title">
                <span>${reason!'<@spring.message "error.general" />'}</span>
            </h2>
            <p class="error-text">
                <@spring.message "error.general.details" />
            </p>
            <a href="/" class="error-button">
                <@spring.message "index.main" />
            </a>
        </div>
    </div>
</@layout.page>