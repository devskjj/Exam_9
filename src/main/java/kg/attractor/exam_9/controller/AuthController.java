package kg.attractor.exam_9.controller;

import jakarta.validation.Valid;
import kg.attractor.exam_9.dto.user.LoginDto;
import kg.attractor.exam_9.dto.user.UserRegistrationDto;
import kg.attractor.exam_9.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthController {
    private final UserService userService;

    @GetMapping("/login")
    public String loginPage(@RequestParam(value = "error", required = false) String error, Model model) {
        if (error != null) {
            model.addAttribute("error", "Неверный логин или пароль");
        }

        model.addAttribute("loginDto", new LoginDto());
        return "login";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("loginDto") LoginDto loginDto,
                        BindingResult bindingResult,
                        RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "login";
        }

        return "redirect:/auth/login?error";
    }

    @GetMapping("/register")
    public String registerPage(Model model) {
        model.addAttribute("userDto", new UserRegistrationDto());
        return "register";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("userDto") UserRegistrationDto registrationDto, BindingResult bindingResult,
                           Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("userDto", registrationDto);
            return "register";
        }

        try {
            userService.register(registrationDto);
            return "redirect:/auth/login?registered=true";
        } catch (Exception e) {
            bindingResult.rejectValue("email", "error.userDto", e.getMessage());
            model.addAttribute("userDto", registrationDto);
            return "register";
        }
    }
}
