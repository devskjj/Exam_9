package kg.attractor.exam_9.repository;

import kg.attractor.exam_9.entities.ServiceProvider;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ServiceProviderRepository extends JpaRepository<ServiceProvider, Integer> {
    Optional<ServiceProvider> findByName(String name);
}
