package kg.attractor.exam_9.dto.user;

import kg.attractor.exam_9.dto.TransactionDto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserProfileDto {
    private Integer id;
    private String username;
    private String email;
    private String accountNumber;
    private Double balance;
    private String roleName;
    private List<TransactionDto> transactions;
}
