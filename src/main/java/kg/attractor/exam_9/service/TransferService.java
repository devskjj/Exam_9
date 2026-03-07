package kg.attractor.exam_9.service;

import kg.attractor.exam_9.dto.TransferDto;
import kg.attractor.exam_9.entities.Transaction;
import kg.attractor.exam_9.entities.User;
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
public class TransferService {
    private final UserService userService;
    private final TransactionRepository transactionRepository;
    private final MessageSource messageSource;

    @Transactional
    public void transfer(String senderUsername, TransferDto dto) {
        log.info("Sending transfer for user {}", senderUsername);
        User sender = userService.findByEmail(senderUsername);
        User receiver = userService.getUserByAccountNumber(dto.getTargetAccountNumber());

        if (sender.getAccountNumber().equals(receiver.getAccountNumber())) {
            throw new RuntimeException(getMessage("transfer.error.self"));
        }

        if (sender.getBalance() < dto.getAmount()) {
            throw new RuntimeException(getMessage("transfer.error.insufficient.funds"));
        }

        if (dto.getAmount() <= 0) {
            throw new RuntimeException(getMessage("transfer.error.invalid.amount"));
        }

        sender.setBalance(sender.getBalance() - dto.getAmount());
        receiver.setBalance(receiver.getBalance() + dto.getAmount());

        String sentDescription = getMessage("transaction.sent.description", receiver.getUsername());
        String receivedDescription = getMessage("transaction.received.description", sender.getUsername());

        Transaction senderTransaction = new Transaction();
        senderTransaction.setUser(sender);
        senderTransaction.setAmount(dto.getAmount());
        senderTransaction.setType("TRANSFER_SENT");
        senderTransaction.setCounterparty(receiver.getAccountNumber());
        senderTransaction.setDescription(sentDescription);

        Transaction receiverTransaction = new Transaction();
        receiverTransaction.setUser(receiver);
        receiverTransaction.setAmount(dto.getAmount());
        receiverTransaction.setType("TRANSFER_RECEIVED");
        receiverTransaction.setCounterparty(sender.getAccountNumber());
        receiverTransaction.setDescription(receivedDescription);

        userService.saveUser(sender);
        userService.saveUser(receiver);
        transactionRepository.save(senderTransaction);
        transactionRepository.save(receiverTransaction);

        log.info("Transfer from {} to {} amount: {}", sender.getEmail(), receiver.getEmail(), dto.getAmount());
    }

    private String getMessage(String code, Object... args) {
        Locale locale = LocaleContextHolder.getLocale();
        return messageSource.getMessage(code, args, locale);
    }
}
