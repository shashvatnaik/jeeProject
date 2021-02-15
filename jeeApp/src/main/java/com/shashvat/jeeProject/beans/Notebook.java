package com.shashvat.jeeProject;

import java.util.*;
import java.sql.*;

public class Notebook {
    int id, uid;
    String noteBookName;

    Notebook(){
        this.id=0;
        this.uid=0;
        this.noteBookName="";
    }

    Notebook(String noteBookName, int uid){
        this.id = 0;
        this.noteBookName = noteBookName;
        this.uid = uid;
    }

    Notebook(int id){
        this.id = id;
    }

    public void setNoteBookName(String newName){
        this.noteBookName = newName;
    }
    public String getNoteBookName(){
        return this.noteBookName;
    }

    public void setUid(int newUid){
        this.uid = newUid;
    }
    public int getUid(){
        return this.uid;
    }

    public void setId(int newId){
        this.id = newId;
    }
    public int getId(){
        return this.id;
    }

    public int addNewNoteBook(){
        try{
            JDBCUtils dbUtil = new JDBCUtils();
            Connection conn = dbUtil.getConnection();
            PreparedStatement pst = conn.prepareStatement("select * from NoteBook where noteBookName='"+this.noteBookName+"' and user_id='"+this.uid+"';");
            ResultSet rs = pst.executeQuery();
            int count = 0;
            while(rs.next()){
                count++;
            }
            if(count>0){
                return 0;
            } else {
                PreparedStatement st1 = conn.prepareStatement("insert into notebook values(?, ?, ?);");
                st1.setString(1, null);
                st1.setString(2, this.noteBookName);
                st1.setInt(3, this.uid);
                st1.executeUpdate();
                return 1;
                
            }
        } catch(Exception e){
            e.printStackTrace();
            return -1;
        }
    }
    
    public HashMap<String, Integer> getAllNotebooks(int userId){
        HashMap<String, Integer> resultMap = new HashMap<>();
        try{
            JDBCUtils dbUtil = new JDBCUtils();
            Connection conn = dbUtil.getConnection();
            PreparedStatement pst = conn.prepareStatement("select * from NoteBook where user_id='"+userId+"';");
            ResultSet rs = pst.executeQuery();
            int count = 0;
            
            while(rs.next()){
                System.out.println(rs.getString("noteBookName")+" : "+rs.getInt("id"));
                resultMap.put(rs.getString("noteBookName"), rs.getInt("id"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return resultMap;
    }
    
    public boolean deleteNoteBook(int id) {
        try{
            System.out.println("delete notebook userId"+this.uid+"and id = "+id);
            JDBCUtils dbUtil = new JDBCUtils();
            Connection conn = dbUtil.getConnection();
            PreparedStatement st1 = conn.prepareStatement("delete from NoteBook where id=? and user_id=?;");
            st1.setInt(1, id);
            st1.setInt(2, uid);
            st1.executeUpdate();
            return true;
        } catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public boolean editNoteBook(String newName, int notebookId){
        try{
            JDBCUtils dbUtil = new JDBCUtils();
            Connection conn = dbUtil.getConnection();
            System.out.println("new name="+newName+"userid="+this.uid+" and id="+notebookId);
            PreparedStatement st1 = conn.prepareStatement("update NoteBook set noteBookName=? where user_id=? and id=?;");
            st1.setString(1, newName);
            st1.setInt(2, this.uid);
            st1.setInt(3, notebookId);
            System.out.println("execute update"+st1.executeUpdate());
            return true;
        } catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public ArrayList getNoteBookDetails(int userId){
        ArrayList<HashMap<String, String>> result = new ArrayList<>();

        try{
            JDBCUtils dbUtil = new JDBCUtils();
            Connection conn = dbUtil.getConnection();
            PreparedStatement pst = conn.prepareStatement("select * from NoteBook where id='"+this.id+"' and user_id='"+userId+"';");
            ResultSet rs = pst.executeQuery();
            int count = 0;
            while(rs.next()){
                count++;
            }
            if(count>0){
                PreparedStatement st1 = conn.prepareStatement("select * from note where noteBook_id="+this.id+";");
                ResultSet notesResult = st1.executeQuery();
                while(notesResult.next()){
                    HashMap<String, String> temp = new HashMap<>();
                    temp.put("id", notesResult.getString("id"));
                    temp.put("noteName", notesResult.getString("noteName"));
                    temp.put("noteDescription", notesResult.getString("noteDescription"));
                    temp.put("startDate", notesResult.getString("startDate"));
                    temp.put("endDate", notesResult.getString("endDate"));
                    temp.put("reminderDate", notesResult.getString("remainderDate"));
                    temp.put("status", notesResult.getString("status_id"));
                    temp.put("tag", notesResult.getString("tag_id"));
                    result.add(temp);
                }
            }
        } catch(Exception e){
            e.printStackTrace();
        }

        return result;
    }

}