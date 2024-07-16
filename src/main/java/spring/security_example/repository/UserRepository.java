package spring.security_example.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import spring.security_example.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
