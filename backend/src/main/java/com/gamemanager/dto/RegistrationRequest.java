package com.gamemanager.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
//import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;


public class RegistrationRequest {
    @NotBlank
    @Size(max=50)
    private String userName;

    @NotBlank
    @Size(min=8,max=255)
    @Pattern(regexp = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[^A-Za-z\\d]).+$")
    private String password;

    @NotBlank
    @Size(max=255)
    @Email
    private String email;

    public String getUserName(){
    return userName;
    }

    public void setUserName(String userName){
        this.userName = userName;
    }

    public String getPassword(){
        return password;
    }

    public void setPassword(String password){
        this.password = password;
    }

    public String getEmail(){
        return email;
    }

    public void setEmail(String email){
        this.email = email;
    }


}



