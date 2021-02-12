package com.shashvat.jeeProject;

import java.sql.*;

public class Notebook {
    int id, uid;
    String noteBookName;

    Notebook(){
        id=0;
        uid=0;
        noteBookName="";
    }

    Notebook(String noteBookName, int uid){
        this.id = 0;
        this.noteBookName = noteBookName;
        this.uid = uid;
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
}