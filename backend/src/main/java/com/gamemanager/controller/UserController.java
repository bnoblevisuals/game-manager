package com.gamemanager.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gamemanager.dto.RegistrationRequest;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@RestController
@RequestMapping("/api/users")
public class UserController {
    @PostMapping("/register")
public ResponseEntity<String> register(@RequestBody @Valid RegistrationRequest request)
    {   
        return ResponseEntity.status(HttpStatus.CREATED).body(
            "User registration received"
        );
    }
}
