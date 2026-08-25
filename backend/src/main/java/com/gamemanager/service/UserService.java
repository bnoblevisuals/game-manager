package com.gamemanager.service;


import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.gamemanager.dto.RegistrationRequest;

@Service
public class UserService {
   
    private final  PasswordEncoder passwordEncoder;

    public UserService(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    public String register(RegistrationRequest request) {
        
        String hashedPassword = 
        passwordEncoder.encode(request.getPassword());
        return hashedPassword;
    }
}
