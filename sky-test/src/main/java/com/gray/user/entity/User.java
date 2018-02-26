package com.gray.user.entity;

/**
 * Created by wz on 2018/2/26.
 */
public class User {
    private String role;
    private String username;
    private String password;

    public String getRole() {
        return role;
    }

    public String getPassword() {
        return password;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }
}
