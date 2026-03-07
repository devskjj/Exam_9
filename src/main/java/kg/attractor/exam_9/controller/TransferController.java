package kg.attractor.exam_9.controller;

import kg.attractor.exam_9.dto.TransferDto;
import kg.attractor.exam_9.service.TransferService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/transfer")
@RequiredArgsConstructor
public class TransferController {

    private final TransferService transferService;

    @GetMapping
    public String transferPage(Model model) {
        model.addAttribute("transferDto", new TransferDto());
        return "transfer";
    }

    @PostMapping
    public String transfer(@AuthenticationPrincipal UserDetails userDetails,
                           @ModelAttribute("transferDto") TransferDto transferDto,
                           RedirectAttributes redirectAttributes) {
        try {
            String userEmail = userDetails.getUsername();
            transferService.transfer(userEmail, transferDto);
            redirectAttributes.addFlashAttribute("success", "Перевод успешно выполнен!");
            return "redirect:/profile";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Ошибка перевода: " + e.getMessage());
            return "redirect:/transfer";
        }
    }
}
