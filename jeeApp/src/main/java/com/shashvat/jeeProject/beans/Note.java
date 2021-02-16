package com.shashvat.jeeProject;

import java.util.*;
import java.sql.*;

public class Note{
    int id, tag, status, noteBookId;
    String name, description, startDate, endDate, reminderDate;
    Note(){
        id=0;
        tag=0;
        status=0;
        noteBookId=0;
        name="";
        description="";
        startDate="";
        endDate="";
        reminderDate="";
    }

    public int getId(){
        return this.id;
    }
    public void setId(int newId){
        this.id = newId;
    }

    public int getTag(){
        return this.tag;
    }
    public void setTag(int newTag){
        this.tag = newTag;
    }

    public int getStatus(){
        return status;
    }
    public void setStatus(int newStatus){
        this.status = newStatus;
    }

    public int getNoteBookId(){
        return noteBookId;
    }
    public void setNoteBookId(int newNoteBookId){
        this.noteBookId = newNoteBookId;
    }

    public String getName(){
        return name;
    }
    public void setName(String newName){
        this.name = newName;
    }

    public String getDescription(){
        return description;
    }
    public void setDescription(String newDescription){
        this.description = newDescription;
    }

    public String getStartDate(){
        return startDate;
    }
    public void setStartDate(String newStartDate){
        this.startDate = newStartDate;
    }

    public String getEndDate(){
        return endDate;
    }
    public void setEndDate(String newEndDate){
        this.endDate = newEndDate;
    }

    public String getReminderDate(){
        return reminderDate;
    }
    public void setReminderDate(String newReminderDate){
        this.reminderDate = newReminderDate;
    }

    public boolean addNewNote(){
        try{
            JDBCUtils dbUtil = new JDBCUtils();
            Connection conn = dbUtil.getConnection();
            PreparedStatement st1 = conn.prepareStatement("insert into note values(?, ?, ?, ?, ?, ?, ?, ?, ?);");
            st1.setString(1, null);
            st1.setString(2, this.endDate);
            st1.setString(3, this.description);
            st1.setString(4, this.name);
            st1.setString(5, this.reminderDate);
            st1.setString(6, this.startDate);
            st1.setInt(7, this.noteBookId);
            st1.setInt(8, this.status);
            st1.setInt(9, this.tag);
            st1.executeUpdate();
            return true;
        } catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public boolean editNote(int userId){
        try{
            JDBCUtils dbUtil = new JDBCUtils();
            Connection conn = dbUtil.getConnection();
            PreparedStatement pst = conn.prepareStatement("select * from notebook where id='"+this.noteBookId+"' and user_id='"+userId+"';");
            ResultSet rs = pst.executeQuery();
            int count = 0;
            while(rs.next()){
                count++;
            }
            if(count>0){
                PreparedStatement st1 = conn.prepareStatement("update note set noteName=?, noteDescription=?, startDate=?, endDate=?, remainderDate=?, tag_id=?, status_id=? where id=?");
                st1.setString(1, this.name);
                st1.setString(2, this.description);
                st1.setString(3, this.startDate);
                st1.setString(4, this.endDate);
                st1.setString(5, this.reminderDate);
                st1.setInt(6, this.tag);
                st1.setInt(7, this.status);
                st1.setInt(8, this.id);
                st1.executeUpdate();
                return true;
            } else {
                return false;
            }
        } catch(Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteNote(int userId) {
        try{
            JDBCUtils dbUtil = new JDBCUtils();
            Connection conn = dbUtil.getConnection();
            PreparedStatement pst = conn.prepareStatement("select * from notebook where id='"+this.noteBookId+"' and user_id='"+userId+"';");
            ResultSet rs = pst.executeQuery();
            int count = 0;
            while(rs.next()){
                count++;
            }
            if(count>0){
                PreparedStatement st1 = conn.prepareStatement("delete from note where id=?;");
                st1.setInt(1, this.id);
                st1.executeUpdate();
                return true;
            } else {
                return false;
            }
        } catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public HashMap<String, String> getNoteDetails(int userId){
        HashMap<String, String> result = new HashMap<>();
        try{
            JDBCUtils dbUtil = new JDBCUtils();
            Connection conn = dbUtil.getConnection();
            PreparedStatement pst = conn.prepareStatement("select * from notebook where id='"+this.noteBookId+"' and user_id='"+userId+"';");
            ResultSet rs = pst.executeQuery();
            int count = 0;
            while(rs.next()){
                count++;
            }
            if(count>0){
                PreparedStatement st = conn.prepareStatement("select * from note where id="+this.id+";");
                ResultSet noteResult = st.executeQuery();
                while(noteResult.next()){
                    result.put("id", ""+this.id);
                    result.put("noteName", noteResult.getString("noteName"));
                    result.put("noteDescription", noteResult.getString("noteDescription"));
                    result.put("startDate", noteResult.getString("startDate"));
                    result.put("endDate", noteResult.getString("endDate"));
                    result.put("reminderDate", noteResult.getString("remainderDate"));
                    result.put("tag", noteResult.getString("tag_id"));
                    result.put("status", noteResult.getString("status_id"));
                }
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }
}