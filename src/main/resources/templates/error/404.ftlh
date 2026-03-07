<#import "/spring.ftl" as spring>
<#import "../layout.ftlh" as layout>

<@layout.page title="">
    <div class="error-page">
        <div class="error-content">
            <h1 class="error-code">${status!404}</h1>
            <h2 class="error-title">
                <span><@spring.message "error.not_found" /></span>
            </h2>
            <p class="error-text">
                <@spring.message "error.not_found.details" />
            </p>
            <a href="/" class="error-button">
                <@spring.message "index.main" />
            </a>
        </div>
    </div>
</@layout.page>