package kg.attractor.exam_9.service;

import kg.attractor.exam_9.dto.TransferDto;
import kg.attractor.exam_9.entities.Transaction;
import kg.attractor.exam_9.entities.User;
import kg.attractor.exam_9.repository.TransactionRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@RequiredArgsConstructor
public class TransferService {
    private final UserService userService;
    private final TransactionRepository transactionRepository;

    @Transactional
    public void transfer(String senderUsername, TransferDto dto) {
        User sender = userService.findByEmail(senderUsername);
        User receiver = userService.getUserByAccountNumber(dto.getTargetAccountNumber());

        if (sender.getAccountNumber().equals(receiver.getAccountNumber())) {
            throw new RuntimeException("Cannot transfer to yourself");
        }

        if (sender.getBalance() < dto.getAmount()) {
            throw new RuntimeException("Insufficient funds");
        }

        if (dto.getAmount() <= 0) {
            throw new RuntimeException("Сумма перевода должна быть положительной");
        }

        sender.setBalance(sender.getBalance() - dto.getAmount());
        receiver.setBalance(receiver.getBalance() + dto.getAmount());

        Transaction senderTransaction = new Transaction();
        senderTransaction.setUser(sender);
        senderTransaction.setAmount(dto.getAmount());
        senderTransaction.setType("TRANSFER_SENT");
        senderTransaction.setCounterparty(receiver.getAccountNumber());
        senderTransaction.setDescription("Transfer to " + receiver.getUsername());

        Transaction receiverTransaction = new Transaction();
        receiverTransaction.setUser(receiver);
        receiverTransaction.setAmount(dto.getAmount());
        receiverTransaction.setType("TRANSFER_RECEIVED");
        receiverTransaction.setCounterparty(sender.getAccountNumber());
        receiverTransaction.setDescription("Transfer from " + sender.getUsername());

        userService.saveUser(sender);
        userService.saveUser(receiver);
        transactionRepository.save(senderTransaction);
        transactionRepository.save(receiverTransaction);

        log.info("Transfer from {} to {} amount: {}", sender.getEmail(), receiver.getEmail(), dto.getAmount());
    }
}
