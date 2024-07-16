package spring.security_example.DTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AuthRequest {
    private String username;
    private String password;

    public AuthRequest() {
    }

    // 매개변수 있는 생성자
    public AuthRequest(String username, String password) {
        this.username = username;
        this.password = password;
    }
}
