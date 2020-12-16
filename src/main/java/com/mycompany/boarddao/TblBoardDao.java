/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.boarddao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import java.util.*;

/**
 *
 * @author Mincheol
 */
public class TblBoardDao {
    /*
    String drv = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:oracle:thin:@203.247.239.1:1521:stud1";
    String user = "mc1128", password="1234";
    */

    String drv="com.mysql.cj.jdbc.Driver";
    String url="jdbc:mysql://localhost:3306/mysql?serverTimezone=Asia/Seoul";
    String user="root", password="as123123";
    //String sql="select * from tblboard";
    Connection c = null;
    Statement st = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Connection makeConnection() throws SQLException{
        try{
            Class.forName(drv);
            c= DriverManager.getConnection(url, user, password);
        } catch(ClassNotFoundException ex){
            System.out.println("StackTrace:"+ ex.getStackTrace()+"원인: "+ ex.getCause());
        } catch(SQLException ex){
            System.out.println("SQL State: "+ ex.getSQLState() + ex.getMessage());
        }
        return c;
    }
    
    public ResultSet getRs(String sql){
        try{
            c= makeConnection();
            st= c.createStatement();
            rs= st.executeQuery(sql);
        }catch(SQLException ex){
            System.out.println("SQL ERR State: "+ ex.getSQLState() + ex.getMessage());
        } finally{
            
        }
        return rs;
    }
    
    public boolean existATuple(String sql){
        try{
            rs=getRs(sql);
            if(rs.next()) return true;
        }catch(SQLException ex){
            System.out.println("SQL ERR State: "+ ex.getSQLState());
        }
        return false;
    }
    
    public List makeList(String sql){
        List list = new ArrayList();
        TblBoardBean tb = null;
        try{
            rs=getRs(sql);
            while(rs.next()){
                tb = new TblBoardBean();
                tb.setNum(rs.getInt(1));
                tb.setName(rs.getString(2));
                tb.setPasswd(rs.getString(3));
                tb.setEmail(rs.getString(4));
                tb.setTitle(rs.getString(5));
                tb.setContents(rs.getString(6));
                tb.setWritedate(rs.getString(7));
                tb.setReadcount(rs.getInt(8));
                tb.setRef(rs.getInt(9));
                tb.setIndent(rs.getInt(10));
                tb.setStep(rs.getInt(11));
                tb.setStep2(rs.getInt(12));
                tb.setFilename(rs.getString(13));
                list.add(tb);
            }
            }catch(SQLException ex){
            System.out.println("SQL ERR State: "+ ex.getSQLState() + ex.getMessage());
        }
            return list;
      
        }
    
    public int insertATuple(String sql, TblBoardBean tb){
        int n=0;
        try{
            c= makeConnection();
            ps = c.prepareStatement(sql);
            ps.setInt(1,tb.getNum());
            ps.setString(2,tb.getName());
            ps.setString(3,tb.getPasswd());
            ps.setString(4,tb.getEmail());
            ps.setString(5,tb.getTitle());
            ps.setString(6,tb.getContents());
            ps.setString(7,tb.getWritedate());
            ps.setInt(8,tb.getReadcount());
            ps.setInt(9,tb.getRef());
            ps.setInt(10,tb.getIndent());
            ps.setInt(11,tb.getStep());
            ps.setInt(12,tb.getStep2());
            ps.setString(13,tb.getFilename());
            n = ps.executeUpdate();     
            System.out.println(n);
        }catch(SQLException ex){
            System.out.println("SQL ERR State: "+ ex.getSQLState() + ex.getMessage());
            
        }
        return n;
    }
    
    public int getMaxNum(String sql){
        int num = 0;
        try{
        rs = getRs(sql);
        rs.next();
        num = rs.getInt(1);
        }catch(SQLException ex){
            System.out.println("SQL ERR State: "+ ex.getSQLState() + ex.getMessage());
        }
        return num;
    }
    
    public int updateReadcount(String sql){
        int n=0;
        try{
            c = makeConnection();
            ps = c.prepareStatement(sql);
            n = ps.executeUpdate();          
        }catch(SQLException ex){
            System.out.println("SQL ERR State: "+ ex.getSQLState() + ex.getMessage());
        }
        return n;
    }
    public int updateData(String sql){
        int n=0;
        try{
            c = makeConnection();
            ps = c.prepareStatement(sql);
            n = ps.executeUpdate();          
        }catch(SQLException ex){
            System.out.println("SQL ERR State: "+ ex.getSQLState()+ ex.getMessage());
        }
        return n;
    }
    
    public PreparedStatement getPstmt(String sql){
        try{
            c= makeConnection();
            ps = c.prepareStatement(sql);
        }catch(SQLException ex){
            System.out.println("SQL ERR State: "+ ex.getSQLState() + ex.getMessage());
        } finally{
            
        }
        return ps;
    }
    
        public int insertReply(String sql, TblBoardBean tb){
        int n=0;
        try{
            c= makeConnection();
            ps = c.prepareStatement(sql);
            ps.setInt(1,tb.getNum());
            ps.setString(2,tb.getName());
            ps.setString(3,tb.getPasswd());
            ps.setString(4,tb.getEmail());
            ps.setString(5,tb.getTitle());
            ps.setString(6,tb.getContents());
            ps.setString(7,tb.getWritedate());
            ps.setInt(8,tb.getReadcount());
            ps.setInt(9,tb.getRef());
            ps.setInt(10,tb.getIndent());
            ps.setInt(11,tb.getStep());
            ps.setInt(12,tb.getStep2());
            ps.setString(13,tb.getFilename());
            n = ps.executeUpdate();     
            System.out.println(n);
        }catch(SQLException ex){
            System.out.println("SQL ERR State: "+ ex.getSQLState() + ex.getMessage());     
        }
        return n;
    }
}
