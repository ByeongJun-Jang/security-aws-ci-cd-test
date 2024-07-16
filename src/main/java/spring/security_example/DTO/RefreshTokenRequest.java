package spring.security_example.DTO;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class RefreshTokenRequest {
    private String refreshToken;

    // 기본 생성자
    public RefreshTokenRequest() {
    }

    // 매개변수 있는 생성자
    public RefreshTokenRequest(String refreshToken) {
        this.refreshToken = refreshToken;
    }
}
