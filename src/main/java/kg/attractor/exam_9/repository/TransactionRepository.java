package kg.attractor.exam_9.repository;

import kg.attractor.exam_9.entities.Transaction;
import kg.attractor.exam_9.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TransactionRepository extends JpaRepository<Transaction, Integer> {
    List<Transaction> findByUserOrderByDateDesc(User user);
}
