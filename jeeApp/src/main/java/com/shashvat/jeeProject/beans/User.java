package com.shashvat.jeeProject;
import java.sql.*;

public class User {
    String username, mobile, email, password;
    Integer id;
    User(){
        username="";
        mobile="";
        email="";
        password="";
        id=0;
    }

    User(String u, String m, String e, String p){
        username = u;
        mobile = m;
        email = e;
        password = p;
        id = 0;
    }

    User(String u, String m, String e, String p, Integer i){
        username = u;
        mobile = m;
        email = e;
        password = p;
        id = i;
    }

    public void setId(Integer id) {
	this.id = id;
    }
    public String getUserName() {
        return username;
    }
    public void setUserName(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email=email;
    }

    public String getMobile() {
        return mobile;
    }
    public void setMobile(String mobileNumber) {
        this.mobile = mobile;
    }

    public boolean registerUser(){
        JDBCUtils dbUtil = new JDBCUtils();
        Connection conn = dbUtil.getConnection();
        System.out.println("inside user class register method");
        return true;
    }

}