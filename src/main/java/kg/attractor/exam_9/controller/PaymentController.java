package kg.attractor.exam_9.controller;

import kg.attractor.exam_9.dto.PaymentDto;
import kg.attractor.exam_9.dto.ServiceProviderDto;
import kg.attractor.exam_9.service.PaymentService;
import kg.attractor.exam_9.service.ServiceProviderService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/payment")
@RequiredArgsConstructor
public class PaymentController {

    private final PaymentService paymentService;
    private final ServiceProviderService providerService;
    private final MessageSource messageSource;

    @GetMapping
    public String paymentPage(Model model) {
        List<ServiceProviderDto> providers = providerService.getAllProviders();
        model.addAttribute("providers", providers);
        model.addAttribute("paymentDto", new PaymentDto());
        return "payment";
    }

    @PostMapping
    public String pay(@AuthenticationPrincipal UserDetails userDetails,
                      @ModelAttribute("paymentDto") PaymentDto paymentDto,
                      RedirectAttributes redirectAttributes) {
        try {
            String userEmail = userDetails.getUsername();
            paymentService.processPayment(userEmail, paymentDto);

            String successMessage = messageSource.getMessage(
                    "payment.success",
                    null,
                    LocaleContextHolder.getLocale()
            );

            redirectAttributes.addFlashAttribute("success", successMessage);
            return "redirect:/profile";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/payment";
        }
    }
}