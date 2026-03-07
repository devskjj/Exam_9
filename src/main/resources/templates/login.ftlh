<#import "/spring.ftl" as spring />
<#import "layout.ftlh" as layout>

<@layout.page title="">
    <div class="content-card" style="max-width: 400px; margin: 0 auto;">
        <h1 class="page-title"><@spring.message "login.page.title"/></h1>

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
                <label for="email" class="form-label">
                    📧 <@spring.message "login.email.label"/>
                </label>
                <@spring.bind "loginDto.email"/>
                <div class="input-group">
                    <input type="email"
                           id="email"
                           name="username"
                           value="${spring.status.value!}"
                           placeholder="<@spring.message "login.email.placeholder"/>"
                           class="form-control <#if spring.status.error>is-invalid</#if>">
                </div>
                <@spring.showErrors "<br/>", "invalid-feedback d-block"/>
            </div>

            <div class="form-group">
                <label for="password" class="form-label">
                    🔒 <@spring.message "login.password.label"/>
                </label>
                <@spring.bind "loginDto.password"/>
                <div class="input-group">
                    <input type="password"
                           id="password"
                           name="password"
                           value="${spring.status.value!}"
                           placeholder="<@spring.message "login.password.placeholder"/>"
                           class="form-control <#if spring.status.error>is-invalid</#if>">
                </div>
                <@spring.showErrors "<br/>", "invalid-feedback d-block"/>
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
