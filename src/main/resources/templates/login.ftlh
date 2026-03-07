<#import "spring.ftl" as spring>
<#import "layout.ftlh" as layout>

<@layout.page title="">
    <div class="content-card" style="max-width: 400px; margin: 0 auto;">
        <h1 class="page-title">🔐 <@spring.message "login.page.title"/></h1>

        <#if error??>
            <div class="alert alert-danger">
                <@spring.message "login.error.message"/>
            </div>
        </#if>

        <#if registered??>
            <div class="alert alert-success">
                <@spring.message "login.success.message"/>
            </div>
        </#if>

        <form action="/auth/login" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="form-group">
                <label for="email">📧 <@spring.message "login.email.label"/></label>
                <input type="email" id="email" name="username"
                       placeholder="<@spring.message "login.email.placeholder"/>" required>
            </div>

            <div class="form-group">
                <label for="password">🔒 <@spring.message "login.password.label"/></label>
                <input type="password" id="password" name="password"
                       placeholder="<@spring.message "login.password.placeholder"/>" required>
            </div>

            <button type="submit" class="btn btn-primary" style="width: 100%;">
                <@spring.message "login.submit"/>
            </button>
        </form>

        <div style="text-align: center; margin-top: 20px;">
            <a href="/auth/register" style="color: #667eea;">
                <@spring.message "login.register.link"/>
            </a>
        </div>
    </div>
</@layout.page>