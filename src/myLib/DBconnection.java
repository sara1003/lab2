package myLib;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

public class DBconnection {

	private String jdbcDriver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/bookDB?useSSL=false&characterEncoding=UTF-8";
	private String username = "root";
	private String password = "2218234907";
	private String url1 = "jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_mylib";
	private String username1 = "zyyll5kzjm";
	private String password1 = "kzmhhx2lwy3xhm5wxx5hxm4y12wky0l3yxj5w13w";
	private String dbusername = System.getenv("ACCESSKEY");
	private String dbpassword = System.getenv("SECRETKEY");
	private String dbUrl = String.format("jdbc:mysql://%s:%s/%s", System.getenv("MYSQL_HOST"), System.getenv("MYSQL_PORT"), System.getenv("MYSQL_DB"));
	
	private Boolean flag = true;
	
	private Connection connectDB(){
		try{
			Class.forName(jdbcDriver);
		}
		catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		try{
			Connection connect = DriverManager.getConnection(dbUrl,dbusername,dbpassword);
			return connect;
		}
		catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
		
	public Boolean getFlag() {
		return flag;
	}
		
	public ArrayList<Map<String, Object>> queryByAuth(String author) throws SQLException {
		Connection connect = connectDB();	
		if (connect==null) return null;
		String sqlStatement = "select ISBN, Title from book where AuthorID = (?)";
		ArrayList<Map<String, Object>> lst = new ArrayList<Map<String, Object>>();
		PreparedStatement ps;
		try {
			int id = getAuthorIDbyName(author);
			ps = (PreparedStatement) connect.prepareStatement(sqlStatement);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData md = rs.getMetaData();
			int column = md.getColumnCount();
			
			while(rs.next()) {
				Map<String, Object> rowData = new HashMap<String, Object>();
				for(int i = 1;i<=column;i++) {
					
					rowData.put(md.getColumnName(i), rs.getObject(i));	
				}
				rowData.put("bookImage","bookImage/"+rowData.get("ISBN")+".jpg");
				lst.add(rowData);
			}
			
			connect.close();
			return lst;	
		}
		catch(Exception e) {
			e.printStackTrace();
			connect.close();
			return null;
		}
	}
	
	public ArrayList<Map<String, Object>> queryDetial(String ISBN, String author) throws SQLException {
		Connection connect = connectDB();	
		if (connect==null) return null;
		String sqlStatement = "select * from book where ISBN = (?)";
		ArrayList<Map<String, Object>> lst = new ArrayList<Map<String, Object>>();
		
		Map<String, Object> authList = queryAuthor(author);
		
		if (authList==null) {connect.close();return null;}
		lst.add(authList);
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) connect.prepareStatement(sqlStatement);
			ps.setString(1, ISBN);
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData md = rs.getMetaData();
			int column = md.getColumnCount();
			
			while(rs.next()) {
				Map<String, Object> rowData = new HashMap<String, Object>();
				for(int i = 1;i<=column;i++) {
					
					rowData.put(md.getColumnName(i), rs.getObject(i));	
				}
				rowData.put("bookImage","bookImage/"+rowData.get("ISBN")+".jpg");
				lst.add(rowData);
			}
			
			connect.close();
			return lst;	
		}
		catch(Exception e) {
			e.printStackTrace();
			connect.close();
			return null;
		}
	}
	
	public Map<String,Object> queryAuthor(String author) throws SQLException{
		Connection connect = connectDB();
		if (connect==null) return null;
		String sqlStatement1 = "select * from author where Name = (?)";
		Map<String, Object> rowData = new HashMap<String, Object>();
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) connect.prepareStatement(sqlStatement1);
			ps.setString(1, author);
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData md = rs.getMetaData();
			int column = md.getColumnCount();
			while(rs.next()) {
				for(int i = 1;i<=column;i++) {
					rowData.put(md.getColumnName(i), rs.getObject(i));	
				}
			}
			connect.close();
			return rowData;
		}
		catch(Exception e) {
			e.printStackTrace();
			connect.close();
			return null;
		}	
	}
	
	public Boolean delete(String ISBN)throws SQLException{
		Connection connect = connectDB();
		if (connect==null) return false;
		String sqlStatement = "delete from book where ISBN = (?)";
		PreparedStatement ps;
		try {
			System.out.println(ISBN);
			ps = (PreparedStatement) connect.prepareStatement(sqlStatement);
			ps.setString(1, ISBN);
			ps.executeUpdate();
			connect.close();
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			connect.close();
			return false;
		} 
	}
	
	private int getAuthorIDbyName(String author)throws SQLException
	{
		Connection connect = connectDB();
		if (connect==null) return -1;
		String sqlStatement1 = "select AuthorID from author where Name = (?)";
		String sqlStatement2 = "insert into author (Name, Age, Country) value(?,?,?)";
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) connect.prepareStatement(sqlStatement1);
			ps.setString(1, author);
			ResultSet rs = ps.executeQuery();
			int id = 0;
			if (!rs.next()){
				ps = (PreparedStatement) connect.prepareStatement(sqlStatement2);
				ps.setString(1, author);
				ps.setInt(2, 0);
				ps.setString(3, null);
				ps.executeUpdate();
				rs = ps.executeQuery("select LAST_INSERT_ID()");
				if (rs.next())
				id = rs.getInt(1);
				flag = false;
				}
			else id = rs.getInt(1);
			connect.close();
			return id;
			}
		catch(Exception e) {
			e.printStackTrace();
			connect.close();
			return -1;
		}
	}
	public Boolean update(String ISBN, String author, String publisher, Date date, double price )throws SQLException {

		Connection connect = connectDB();
		if (connect==null) return false;
		String sqlStatement = "update book set AuthorID=(?), Publisher=(?), PublishDate=(?), Price=(?) where ISBN = (?)";
		PreparedStatement ps;
		flag = true;
		try {
			int id = getAuthorIDbyName(author);
			ps = (PreparedStatement) connect.prepareStatement(sqlStatement);
			ps.setInt(1, id);
			ps.setString(2, publisher);
			ps.setDate(3, date);
			ps.setDouble(4,price);
			ps.setString(5, ISBN);
			ps.executeUpdate();
			connect.close();
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			connect.close();
			return false;
		} 
	}

	public Boolean insertBook(String ISBN, String Title, String publisher, Date date, double price, String name) throws SQLException{
		Connection connect = connectDB();
		if (connect==null) return false;
		String sqlStatement = "insert into book value(?,?,?,?,?,?)";
		PreparedStatement ps;
		flag = true;
		try {
			int id = getAuthorIDbyName(name);
			
			ps = (PreparedStatement) connect.prepareStatement(sqlStatement);
			ps.setString(1, ISBN);
			ps.setString(2, Title);
			ps.setInt(3, id);
			ps.setString(4, publisher);
			ps.setDate(5, date);
			ps.setDouble(6, price);
			ps.executeUpdate();
			connect.close();
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			connect.close();
			return false;
		} }
	
	public Boolean updateAuthor(String name, int age, String country)throws SQLException
	{
		Connection connect = connectDB();
		if (connect==null) return false;
		String sqlStatement = "update author set Age=(?), Country=(?) where Name = (?)";
		PreparedStatement ps;
		try {
			System.out.println(name);
			ps = (PreparedStatement) connect.prepareStatement(sqlStatement);
			ps.setInt(1, age);
			ps.setString(2, country);
			ps.setString(3, name);
			ps.executeUpdate();
			connect.close();
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			connect.close();
			return false;
		} 
	}
}


