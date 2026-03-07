package kg.attractor.exam_9.controller;

import kg.attractor.exam_9.dto.UserProfileDto;
import kg.attractor.exam_9.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/profile")
@RequiredArgsConstructor
public class ProfileController {

    private final UserService userService;

    @GetMapping
    public String profilePage(@AuthenticationPrincipal UserDetails userDetails, Model model) {
        String email = userDetails.getUsername();
        UserProfileDto profile = userService.getUserProfileByEmail(email);

        model.addAttribute("profile", profile);
        model.addAttribute("balance", profile.getBalance());
        model.addAttribute("transactions", profile.getTransactions());

        return "profile";
    }
}
