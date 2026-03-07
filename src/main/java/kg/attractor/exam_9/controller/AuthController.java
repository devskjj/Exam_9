package kg.attractor.exam_9.controller;

import kg.attractor.exam_9.dto.UserRegistrationDto;
import kg.attractor.exam_9.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthController {

    private final UserService userService;

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @GetMapping("/register")
    public String registerPage(Model model) {
        model.addAttribute("userDto", new UserRegistrationDto());
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute("userDto") UserRegistrationDto registrationDto) {
        try {
            userService.register(registrationDto);
            return "redirect:/auth/login?registered=true";
        } catch (Exception e) {
            return "redirect:/auth/register?error=" + e.getMessage();
        }
    }
}
