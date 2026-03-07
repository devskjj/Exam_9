package kg.attractor.exam_9.service;

import jakarta.validation.ValidationException;
import kg.attractor.exam_9.dto.TransactionDto;
import kg.attractor.exam_9.dto.UserProfileDto;
import kg.attractor.exam_9.dto.UserRegistrationDto;
import kg.attractor.exam_9.entities.Role;
import kg.attractor.exam_9.entities.Transaction;
import kg.attractor.exam_9.entities.User;
import kg.attractor.exam_9.repository.RoleRepository;
import kg.attractor.exam_9.repository.TransactionRepository;
import kg.attractor.exam_9.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.NoSuchElementException;
import java.util.UUID;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final TransactionRepository transactionRepository;
    private final PasswordEncoder passwordEncoder;

    @Transactional
    public void register(UserRegistrationDto dto) {
        if (userRepository.existsByEmail(dto.getEmail())) {
            throw new ValidationException("Пользователь с email " + dto.getEmail() + " уже существует");
        }

        if (userRepository.existsByPhone(dto.getPhone())) {
            throw new ValidationException("Пользователь с телефоном " + dto.getPhone() + " уже существует");
        }

        Role role = roleRepository.findByName(dto.getRoleName()).orElseThrow(() -> new NoSuchElementException("Роль не найдена"));

        User user = User.builder()
                .username(dto.getUsername())
                .email(dto.getEmail())
                .password(passwordEncoder.encode(dto.getPassword()))
                .phone(dto.getPhone())
                .accountNumber(generateAccountNumber())
                .balance(1000.0)
                .enabled(true)
                .role(role)
                .build();

        userRepository.save(user);
        log.info("User with id {} has been created", user.getId());
    }

    private String generateAccountNumber() {
        String accountNumber;
        do {
            accountNumber = UUID.randomUUID().toString().replace("-", "").substring(0, 6).toUpperCase();
        } while (userRepository.existsByAccountNumber(accountNumber));
        return accountNumber;
    }


    public UserProfileDto getUserProfileByEmail(String email) {
        User user = userRepository.findByEmailIgnoreCase(email)
                .orElseThrow(() -> new RuntimeException("User not found with email: " + email));

        UserProfileDto dto = new UserProfileDto();
        dto.setId(user.getId());
        dto.setUsername(user.getUsername());
        dto.setEmail(user.getEmail());
        dto.setAccountNumber(user.getAccountNumber());
        dto.setBalance(user.getBalance());
        dto.setRoleName(user.getRole().getName());

        dto.setTransactions(transactionRepository.findByUserOrderByDateDesc(user)
                .stream()
                .map(this::convertToDto)
                .collect(Collectors.toList()));

        return dto;
    }








    public UserProfileDto getUserProfile(String username) {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found"));

        UserProfileDto dto = new UserProfileDto();
        dto.setId(user.getId());
        dto.setUsername(user.getUsername());
        dto.setAccountNumber(user.getAccountNumber());
        dto.setBalance(user.getBalance());
        dto.setRoleName(user.getRole().getName());

        dto.setTransactions(transactionRepository.findByUserOrderByDateDesc(user)
                .stream()
                .map(this::convertToDto)
                .collect(Collectors.toList()));

        return dto;
    }

    private TransactionDto convertToDto(Transaction transaction) {
        TransactionDto dto = new TransactionDto();
        dto.setId(transaction.getId());
        dto.setAmount(transaction.getAmount());
        dto.setDate(transaction.getDate());
        dto.setType(transaction.getType());
        dto.setCounterparty(transaction.getCounterparty());
        dto.setDescription(transaction.getDescription());
        return dto;
    }

    public User getUserByUsername(String username) {
        return userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found"));
    }

    public User getUserByAccountNumber(String accountNumber) {
        return userRepository.findByAccountNumber(accountNumber)
                .orElseThrow(() -> new RuntimeException("Account not found"));
    }

    public void saveUser(User user) {
        userRepository.save(user);
    }

    public User findByEmail(String email) {
        return userRepository.findByEmailIgnoreCase(email)
                .orElseThrow(() -> new RuntimeException("User not found"));
    }

    public void save(User user) {
        userRepository.save(user);
    }
}
