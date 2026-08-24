package com.gamemanager.dto;

public class RegistrationRequest {
    private String userName;
    private String password;
    private String email;

    public String getUserName(){
    return userName;
    }

    public void setUserName(String userName){
        this.userName = userName;
    }

    public String getUserPassWord(){
        return password;
    }

    public void setUserPassword(String password){
        this.password = password;
    }

    public String getUserEmail(){
        return email;
    }

    public void setUserEmail(String email){
        this.email = email;
    }


}



