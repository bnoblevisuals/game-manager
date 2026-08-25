package com.gamemanager.config;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
@Configuration
public class SecurityConfig {
    
@Bean PasswordEncoder encoder() {
   return new BCryptPasswordEncoder();
}

@Bean SecurityFilterChain securityFilterChain(HttpSecurity http)throws Exception {
        return http
        .csrf((csrf) -> csrf.disable())
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/api/users/register").permitAll()
                        .anyRequest().authenticated()
                )
                .build();
    }
}
