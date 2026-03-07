package kg.attractor.exam_9.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TransactionDto {
    private Integer id;
    private Double amount;
    private LocalDateTime date;
    private String type;
    private String counterparty;
    private String description;
}
