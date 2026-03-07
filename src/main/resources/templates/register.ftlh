<#import "spring.ftl" as spring>
<#import "layout.ftlh" as layout>

<@layout.page title="">
    <div class="content-card" style="max-width: 500px; margin: 0 auto;">
        <h1 class="page-title">📝 <@spring.message "register.page.title"/></h1>

        <#if error??>
            <div class="alert alert-danger">
                <@spring.message "register.error.prefix"/> ${error}
            </div>
        </#if>

        <div class="alert alert-info">
            💡 <@spring.message "register.info"/>
        </div>

        <form action="/auth/register" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="form-group">
                <label for="username">👤 <@spring.message "register.username.label"/></label>
                <input type="text" id="username" name="username"
                       placeholder="<@spring.message "register.username.placeholder"/>" required>
            </div>

            <div class="form-group">
                <label for="email">📧 <@spring.message "register.email.label"/></label>
                <input type="email" id="email" name="email"
                       placeholder="<@spring.message "register.email.placeholder"/>" required>
            </div>

            <div class="form-group">
                <label for="password">🔒 <@spring.message "register.password.label"/></label>
                <input type="password" id="password" name="password"
                       placeholder="<@spring.message "register.password.placeholder"/>" required>
            </div>

            <div class="form-group">
                <label for="phone">📱 <@spring.message "register.phone.label"/></label>
                <input type="tel" id="phone" name="phone"
                       placeholder="<@spring.message "register.phone.placeholder"/>"
                       pattern="[0-9]{10}" required>
                <small class="form-hint"><@spring.message "register.phone.hint"/></small>
            </div>

            <div class="form-group">
                <label for="roleName">👑 <@spring.message "register.role.label"/></label>
                <select id="roleName" name="roleName" required>
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

        <div style="text-align: center; margin-top: 10px;">
            <a href="/" style="color: #999; font-size: 14px;">
                ← <@spring.message "nav.home"/>
            </a>
        </div>
    </div>
</@layout.page>