package kg.attractor.exam_9.config;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kg.attractor.exam_9.entities.User;
import kg.attractor.exam_9.service.UserService;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.LocaleResolver;

import java.util.Locale;

@Component
@RequiredArgsConstructor
public class UserLocaleInterceptor implements HandlerInterceptor {
    private final UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.isAuthenticated() && !"anonymousUser".equals(auth.getPrincipal())) {

            String email = auth.getName();
            String lang = request.getParameter("lang");
            User user = userService.findByEmail(email);
            if (user == null) return true;

            LocaleResolver localeResolver = (LocaleResolver) request.getAttribute(org.springframework.web.servlet.DispatcherServlet.LOCALE_RESOLVER_ATTRIBUTE);

            if (lang != null && !lang.equals(user.getLanguage())) {
                user.setLanguage(lang);
                userService.save(user);
                localeResolver.setLocale(request, response, new Locale(lang));
                return true;
            }

            if (user.getLanguage() != null) {
                localeResolver.setLocale(request, response, new Locale(user.getLanguage())
                );
            }
        }
        return true;
    }
}
