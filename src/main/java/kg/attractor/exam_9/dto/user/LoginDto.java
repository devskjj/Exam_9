package kg.attractor.exam_9.dto.user;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LoginDto {
    @NotBlank(message = "{login.email.required}")
    @Email(message = "{login.email.invalid}")
    private String email;

    @NotBlank(message = "{login.password.required}")
    private String password;
}
