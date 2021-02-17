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

    User(int id){
        username = "";
        mobile = "";
        email = "";
        password = "";
        this.id = id;
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
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public int registerUser(){
        JDBCUtils dbUtil = new JDBCUtils();
        Connection conn = dbUtil.getConnection();
        System.out.println("inside user class register method = "+this.email+this.mobile);
        try{
            PreparedStatement pst = conn.prepareStatement("select * from user where email='"+this.email+"';");
            ResultSet rs = pst.executeQuery();
            int count = 0;
            while(rs.next()){
                System.out.println("Login Successful");
                count++;
            }

            if(count>0){
                return 0;
            } else {
                PreparedStatement st1 = conn.prepareStatement("insert into user values(?, ?, ?, ?, ?);");
                st1.setString(1, null);
                st1.setString(2, this.email);
                st1.setString(3, this.mobile);
                st1.setString(4, this.password);
                st1.setString(5, this.username);
                return st1.executeUpdate();
            }
            
        } catch(Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public boolean editUser(String newUserName, String newMobileNumber){
        try{
            JDBCUtils dbUtil = new JDBCUtils();
            Connection conn = dbUtil.getConnection();
            PreparedStatement st1 = conn.prepareStatement("update user set mobileNumber=?,userName=? where id=?;");
            st1.setString(1, newMobileNumber);
            st1.setString(2, newUserName);
            st1.setInt(3, this.id);
            return 1 == st1.executeUpdate();
        } catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }

}