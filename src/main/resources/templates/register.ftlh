<#import "/spring.ftl" as spring />
<#import "layout.ftlh" as layout>

<@layout.page title="">
    <div class="content-card" style="max-width: 500px; margin: 0 auto;">
        <h1 class="page-title"><@spring.message "register.page.title"/></h1>

        <#if error??>
            <div class="alert alert-danger">
                ${error}
            </div>
        </#if>

        <div class="alert alert-info">
            <@spring.message "register.info"/>
        </div>

        <form action="/auth/register" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="form-group">
                <label for="username" class="form-label">
                    👤 <@spring.message "register.username.label"/>
                </label>
                <@spring.bind "userDto.username"/>
                <div class="input-group">
                    <input type="text"
                           id="username"
                           name="username"
                           value="${(spring.status.value)!''}"
                           placeholder="<@spring.message "register.username.placeholder"/>"
                           class="form-control <#if spring.status.error?? && spring.status.error>is-invalid</#if>">
                </div>
                <#if spring.status.errorMessages??>
                    <@spring.showErrors "<br/>", "invalid-feedback d-block"/>
                </#if>
            </div>

            <div class="form-group">
                <label for="email" class="form-label">
                    📧 <@spring.message "register.email.label"/>
                </label>
                <@spring.bind "userDto.email"/>
                <div class="input-group">
                    <input type="email"
                           id="email"
                           name="email"
                           value="${(spring.status.value)!''}"
                           placeholder="<@spring.message "register.email.placeholder"/>"
                           class="form-control <#if spring.status.error?? && spring.status.error>is-invalid</#if>">
                </div>
                <#if spring.status.errorMessages??>
                    <@spring.showErrors "<br/>", "invalid-feedback d-block"/>
                </#if>
            </div>

            <div class="form-group">
                <label for="phone" class="form-label">
                    📱 <@spring.message "register.phone.label"/>
                </label>
                <@spring.bind "userDto.phone"/>
                <div class="input-group">
                    <input type="tel"
                           id="phone"
                           name="phone"
                           value="${(spring.status.value)!''}"
                           placeholder="<@spring.message "register.phone.placeholder"/>"
                           class="form-control <#if spring.status.error?? && spring.status.error>is-invalid</#if>">
                </div>
                <small class="form-hint"><@spring.message "register.phone.hint"/></small>
                <#if spring.status.errorMessages??>
                    <@spring.showErrors "<br/>", "invalid-feedback d-block"/>
                </#if>
            </div>

            <div class="form-group">
                <label for="password" class="form-label">
                    🔒 <@spring.message "register.password.label"/>
                </label>
                <@spring.bind "userDto.password"/>
                <div class="input-group">
                    <input type="password"
                           id="password"
                           name="password"
                           value="${(spring.status.value)!''}"
                           placeholder="<@spring.message "register.password.placeholder"/>"
                           class="form-control <#if spring.status.error?? && spring.status.error>is-invalid</#if>">
                </div>
                <#if spring.status.errorMessages??>
                    <@spring.showErrors "<br/>", "invalid-feedback d-block"/>
                </#if>
            </div>

            <div class="form-group">
                <label for="roleName" class="form-label">
                    👑 <@spring.message "register.role.label"/>
                </label>
                <select id="roleName" name="roleName" class="form-control">
                    <option value="USER"><@spring.message "register.role.option.user"/></option>
                </select>
            </div>

            <button type="submit" class="btn btn-success" style="width: 100%;">
                <@spring.message "register.submit"/>
            </button>
        </form>

        <div style="text-align: center; margin-top: 20px;">
            <a href="/auth/login" style="color: #667eea;">
                <@spring.message "register.login.link"/>
            </a>
        </div>
    </div>
</@layout.page>