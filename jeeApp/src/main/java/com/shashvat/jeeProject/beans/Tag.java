package com.shashvat.jeeProject;

import java.util.*;
import java.sql.*;

public class Tag {
    int id;
    String tagName;
    Tag(){
        id=0;
        tagName="";
    }

    public HashMap<String, Integer> getAllTags(){
        HashMap<String, Integer> resultMap = new HashMap<>();
        try{
            JDBCUtils dbUtil = new JDBCUtils();
            Connection conn = dbUtil.getConnection();
            PreparedStatement pst = conn.prepareStatement("select * from tag;");
            ResultSet rs = pst.executeQuery();
            int count = 0;
            
            while(rs.next()){
                resultMap.put(rs.getString("tagName"), rs.getInt("id"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return resultMap;
    }
}