package kg.attractor.exam_9.dto.user;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserRegistrationDto {
    @NotBlank(message = "{register.username.required}")
    @Size(min = 2, max = 50, message = "{register.username.size}")
    private String username;

    @NotBlank(message = "{register.email.required}")
    @Email(message = "{register.email.invalid}")
    private String email;

    @NotBlank(message = "{register.phone.required}")
    @Pattern(regexp = "^[0-9]{10}$", message = "{register.phone.invalid}")
    private String phone;

    @NotBlank(message = "{register.password.required}")
    @Size(min = 6, message = "{register.password.size}")
    private String password;

    private String roleName;
}
