package com.ltweb_servlet_ecommerce.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserModel extends AbstractModel<UserModel> {
    private  String userName;
    private String  email;
    private  String password;
    private  String fullName;
    private String birthDay;
    private Timestamp lastLogged;
    private Boolean admin;
    private String association = "none";

//    @Override
//    public String toString() {
//        return "{" +
//                "userName='" + userName + '\'' +
//                ", email='" + email + '\'' +
//                ", password='" + password + '\'' +
//                ", fullName='" + fullName + '\'' +
//                ", birthDay='" + birthDay + '\'' +
//                ", admin=" + admin +
//                ", association='" + association + '\'' +
//                '}';
//    }
}
