package kg.attractor.exam_9.repository;

import kg.attractor.exam_9.entities.ProviderAccount;
import kg.attractor.exam_9.entities.ServiceProvider;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ProviderAccountRepository extends JpaRepository<ProviderAccount, Integer> {
    Optional<ProviderAccount> findByProviderAndAccountNumber(ServiceProvider provider, String accountNumber);

    boolean existsByProviderAndAccountNumber(ServiceProvider provider, String accountNumber);
}
