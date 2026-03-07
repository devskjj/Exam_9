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
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@RequiredArgsConstructor
public class PaymentService {

    private final UserService userService;
    private final ServiceProviderService providerService;
    private final ProviderAccountRepository providerAccountRepository;
    private final TransactionRepository transactionRepository;

    @Transactional
    public void processPayment(String username, PaymentDto dto) {
        User user = userService.getUserByUsername(username);
        ServiceProvider provider = providerService.getProviderById(dto.getProviderId());


        ProviderAccount providerAccount = providerAccountRepository
                .findByProviderAndAccountNumber(provider, dto.getAccountNumber())
                .orElseThrow(() -> new RuntimeException("Provider account not found"));

        if (user.getBalance() < dto.getAmount()) {
            throw new RuntimeException("Insufficient funds");
        }


        user.setBalance(user.getBalance() - dto.getAmount());
        providerAccount.setBalance(providerAccount.getBalance() + dto.getAmount());


        Transaction transaction = new Transaction();
        transaction.setUser(user);
        transaction.setAmount(dto.getAmount());
        transaction.setType("PAYMENT");
        transaction.setCounterparty(provider.getName());
        transaction.setDescription("Payment to " + provider.getName() + " (account: " + dto.getAccountNumber() + ")");

        userService.saveUser(user);
        providerAccountRepository.save(providerAccount);
        transactionRepository.save(transaction);
    }
}
