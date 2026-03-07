package kg.attractor.exam_9.util;

import kg.attractor.exam_9.dto.UserProfileDto;
import kg.attractor.exam_9.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@Slf4j
@ControllerAdvice
@RequiredArgsConstructor
public class GlobalModelAttributes {

    private final UserService userService;

    @ModelAttribute("isAuthenticated")
    public boolean isAuthenticated(@AuthenticationPrincipal UserDetails userDetails) {
        return userDetails != null;
    }

    @ModelAttribute("username")
    public String getUsername(@AuthenticationPrincipal UserDetails userDetails) {
        if (userDetails != null) {
            try {
                String email = userDetails.getUsername();
                UserProfileDto profile = userService.getUserProfileByEmail(email);
                return profile.getUsername();
            } catch (Exception e) {
                log.error("Error getting username for email: {}", userDetails.getUsername());
                return "Пользователь";
            }
        }
        return "";
    }

    @ModelAttribute("balance")
    public Double getBalance(@AuthenticationPrincipal UserDetails userDetails) {
        if (userDetails != null) {
            try {
                String email = userDetails.getUsername();
                UserProfileDto profile = userService.getUserProfileByEmail(email);
                return profile.getBalance();
            } catch (Exception e) {
                log.error("Error getting balance for email: {}", userDetails.getUsername());
                return 0.0;
            }
        }
        return 0.0;
    }
}