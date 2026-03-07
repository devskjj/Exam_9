package kg.attractor.exam_9.service;

import kg.attractor.exam_9.dto.ServiceProviderDto;
import kg.attractor.exam_9.entities.ServiceProvider;
import kg.attractor.exam_9.repository.ServiceProviderRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class ServiceProviderService {
    private final ServiceProviderRepository providerRepository;

    public List<ServiceProviderDto> getAllProviders() {
        return providerRepository.findAll()
                .stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }

    public ServiceProvider getProviderById(Integer id) {
        return providerRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Provider not found"));
    }

    private ServiceProviderDto convertToDto(ServiceProvider provider) {
        ServiceProviderDto dto = new ServiceProviderDto();
        dto.setId(provider.getId());
        dto.setName(provider.getName());
        return dto;
    }
}
