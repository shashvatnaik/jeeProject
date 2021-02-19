package com.shashvat.jeeProject;

import java.util.*;
import java.sql.*;

public class Notification{
    int id, noteBook_id, noteId, read, userId;
    String text, date;
    Notification(){
        id=0;
        noteBook_id=0;
        noteId=0;
        read=0;
        userId=0;
        text="";
        date="";
    }

    public void setId(int id){
        this.id = id;
    }
    public int getId(){
        return this.id;
    }

    public void setNoteBookId(int noteBook_id){
        this.noteBook_id = noteBook_id;
    }
    public int getNoteBook_id(){
        return this.noteBook_id;
    }

    public void setNoteId(int noteId){
        this.noteId = noteId;
    }
    public int getNoteId(){
        return this.noteId;
    }

    public void setRead(int read){
        this.read = read;
    }
    public int getRead(){
        return this.read;
    }

    public void setUserId(int userId){
        this.userId = userId;
    }
    public int getUserId(){
        return this.userId;
    }

    public void setText(String text){
        this.text = text;
    }
    public String getText(){
        return this.text;
    }

    public void setDate(String date){
        this.date = date;
    }
    public String getDate(){
        return this.date;
    }

    public ArrayList getAllNotification(){
        ArrayList<HashMap<String, String>> result = new ArrayList<>();
        try{
            JDBCUtils dbUtil = new JDBCUtils();
            Connection conn = dbUtil.getConnection();
            PreparedStatement pst = conn.prepareStatement("select * from notifications where userId=? and date=?;");
            pst.setInt(1, this.userId);
            pst.setDate(2, new java.sql.Date(System.currentTimeMillis()));
            ResultSet notificationsResult = pst.executeQuery();
            while(notificationsResult.next()){
                HashMap<String, String> temp = new HashMap<String, String>();
                temp.put("id", ""+notificationsResult.getInt("id"));
                temp.put("text", ""+notificationsResult.getString("text"));
                temp.put("noteId", ""+notificationsResult.getInt("noteId"));
                temp.put("noteBook_id", ""+notificationsResult.getInt("noteBook_id"));
                temp.put("read", ""+notificationsResult.getInt("read"));
                temp.put("date", ""+notificationsResult.getString("date"));
                result.add(temp);
            }

        } catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }

    public boolean markRead(){
        try{
            JDBCUtils dbUtil = new JDBCUtils();
            Connection conn = dbUtil.getConnection();
            PreparedStatement pst = conn.prepareStatement("update notifications SET `read`=? where noteBook_id=? and noteId=?;");
            pst.setInt(1, 1);
            pst.setInt(2, this.noteBook_id);
            pst.setInt(3, this.noteId);
            pst.executeUpdate();
            return true;
        } catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public boolean addNotification(){
        try{
            JDBCUtils dbUtil = new JDBCUtils();
            Connection conn = dbUtil.getConnection();
            PreparedStatement pst = conn.prepareStatement("insert into notifications values(null, ?, ?, ?, ?, ?, ?);");
            pst.setString(1, this.text);
            pst.setInt(2, this.noteId);
            pst.setInt(3, this.noteBook_id);
            pst.setInt(4, this.read);
            pst.setInt(5, this.userId);
            pst.setString(6, this.date);
            pst.executeUpdate();
            return true;

        } catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public boolean editNotification(Notification newNotification){
        try{
            JDBCUtils dbUtil = new JDBCUtils();
            Connection conn = dbUtil.getConnection();
            PreparedStatement pst = conn.prepareStatement("update notifications set text=?, date=? where noteBook_id=? and noteId=?");
            pst.setString(1, newNotification.getText());
            pst.setString(2, newNotification.getDate());
            pst.setInt(3, newNotification.getNoteBook_id());
            pst.setInt(4, newNotification.getNoteId());
            pst.executeUpdate();
            return true;
        } catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteNotification(){
        try{
            JDBCUtils dbUtil = new JDBCUtils();
            Connection conn = dbUtil.getConnection();
            PreparedStatement pst = conn.prepareStatement("delete from notifications where noteBook_id=? and noteId=?");
            pst.setInt(1, this.noteBook_id);
            pst.setInt(2, this.noteId);
            pst.executeUpdate();
            return true;
        } catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
}