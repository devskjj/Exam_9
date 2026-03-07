package kg.attractor.exam_9.service;

import kg.attractor.exam_9.dto.PaymentDto;
import kg.attractor.exam_9.entities.ProviderAccount;
import kg.attractor.exam_9.entities.ServiceProvider;
import kg.attractor.exam_9.entities.Transaction;
import kg.attractor.exam_9.entities.User;
import kg.attractor.exam_9.repository.ProviderAccountRepository;
import kg.attractor.exam_9.repository.TransactionRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Locale;

@Slf4j
@Service
@RequiredArgsConstructor
public class PaymentService {

    private final UserService userService;
    private final ServiceProviderService providerService;
    private final ProviderAccountRepository providerAccountRepository;
    private final TransactionRepository transactionRepository;
    private final MessageSource messageSource;

    @Transactional
    public void processPayment(String userEmail, PaymentDto dto) {
        User user = userService.findByEmail(userEmail);
        ServiceProvider provider = providerService.getProviderById(dto.getProviderId());

        ProviderAccount providerAccount = providerAccountRepository
                .findByProviderAndAccountNumber(provider, dto.getAccountNumber())
                .orElseThrow(() -> new RuntimeException(getMessage("payment.error.account.notfound")));



        if (user.getBalance() < dto.getAmount()) {
            throw new RuntimeException(getMessage("payment.error.insufficient.funds"));
        }


        user.setBalance(user.getBalance() - dto.getAmount());
        providerAccount.setBalance(providerAccount.getBalance() + dto.getAmount());

        String description = getMessage("transaction.payment.description",
                provider.getName(), dto.getAccountNumber());

        Transaction transaction = new Transaction();
        transaction.setUser(user);
        transaction.setAmount(dto.getAmount());
        transaction.setType("PAYMENT");
        transaction.setCounterparty(provider.getName());
        transaction.setDescription(description);

        userService.saveUser(user);
        providerAccountRepository.save(providerAccount);
        transactionRepository.save(transaction);

        log.info(getMessage("log.payment.completed",
                user.getEmail(), provider.getName(), dto.getAmount(), dto.getAccountNumber()));

    }

    private String getMessage(String code, Object... args) {
        Locale locale = LocaleContextHolder.getLocale();
        return messageSource.getMessage(code, args, locale);
    }
}
