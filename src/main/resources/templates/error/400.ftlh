<#import "/spring.ftl" as spring>
<#import "../layout.ftlh" as layout>

<@layout.page title="">
    <div class="error-page">
        <div class="error-content">
            <h1 class="error-code">${status!400}</h1>
            <h2 class="error-title">
                <span>${reason!'<@spring.message "error.bad_request" />'}</span>
            </h2>
            <p class="error-text">
                <@spring.message "error.bad_request.details" />
            </p>
            <a href="/" class="error-button">
                <@spring.message "index.main" />
            </a>
        </div>
    </div>
</@layout.page>