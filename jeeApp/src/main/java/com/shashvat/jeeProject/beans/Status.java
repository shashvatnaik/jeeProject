package com.shashvat.jeeProject;

import java.util.*;
import java.sql.*;

public class Status {
    int id;
    String statusName;
    Status(){
        id=0;
        statusName="";
    }

    public HashMap<String, Integer> getAllStatus(){
        HashMap<String, Integer> resultMap = new HashMap<>();
        try{
            JDBCUtils dbUtil = new JDBCUtils();
            Connection conn = dbUtil.getConnection();
            PreparedStatement pst = conn.prepareStatement("select * from status;");
            ResultSet rs = pst.executeQuery();
            int count = 0;
            
            while(rs.next()){                
                resultMap.put(rs.getString("statusName"), rs.getInt("id"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return resultMap;
    }
}