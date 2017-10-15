package myLib;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class BookCrud extends ActionSupport {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String ISBN;
	private String Title;
	private int AuthorID;
	private String Publisher;
	private Date PublishDate;
	private double Price;
	private String Name;
	private int Age;
	private String Country;
	private String bookImage;
	private File Img;
    public File getImg() {
    	return Img;
    }
    public void setImg(File Img) {
    	this.Img = Img;
    }
	
	public String getISBN() {
		return ISBN;
	}
	
	public void setISBN(String ISBN) {
		this.ISBN = ISBN;
	}
	
	public String getTitle() {
		return Title;
	}
	
	public void setTitle(String Title) {
		this.Title = Title;
	}
	
	public int getAuthorID() {
		return AuthorID;
	}
	
	public void setAuthorID(int AuthorID) {
		this.AuthorID = AuthorID;
	}
	
	public String getPublisher() {
		return Publisher;
	}
	
	public void setPublisher(String Publisher) {
		this.Publisher = Publisher;
	}
	
	public Date getPublishDate() {
		return PublishDate;
	}
	
	public void setPublishDate(Date PublishDate) {
		this.PublishDate = PublishDate;
	}
	
	public double getPrice() {
		return Price;
	}
	
	public void setPrice(double Price) {
		this.Price = Price;
	}
	
	public String getName() {
		return Name;
	}
	
	public void setName(String Name) {
		this.Name = Name;
	}
	
	public int getAge() {
		return Age;
	}
	
	public void setAge(int Age) {
		this.Age = Age;
	}
	
	public String getCountry() {
		return Country;
	}
	
	public void setCountry(String Country) {
		this.Country = Country;
	}
	
	public String getBookImage() {
		return bookImage;
	}
	
	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}
	public String retrieveByAuthor() throws SQLException {
		DBconnection conn = new DBconnection();
		HttpServletRequest request = ServletActionContext.getRequest();
		//HttpSession session = request.getSession();
		
		ArrayList<Map<String, Object>> bl = conn.queryByAuth(getName().trim());
		if (bl!=null) {
			request.setAttribute("auName", getName());
			request.setAttribute("booklist", bl); 
			return "success"; }
		else return "error";
	}
	
	public String retrieveDetial()throws SQLException {
		DBconnection conn = new DBconnection();
		HttpServletRequest request = ServletActionContext.getRequest();
		ArrayList<Map<String, Object>> bl = conn.queryDetial(getISBN().trim(), getName().trim());
		if (bl!=null) {
			request.setAttribute("authorInfo", bl.subList(0, 1));
			request.setAttribute("booklist", bl.subList(1,2)); 
			return "success"; }
		else return "error";
	}
	
	public String delete() throws SQLException {
		DBconnection conn = new DBconnection();
		if (conn.delete(getISBN().trim()) == true) return "success";
		else return "error";
	}
	
	public String addBook() throws SQLException  {
		HttpServletRequest request = ServletActionContext.getRequest();
		String projectPath = request.getSession().getServletContext().getRealPath("/");
    	String imgPath = projectPath+"bookImage/"; 
    	System.out.println(imgPath);
    	try {
    		if (Img!=null) {
    			InputStream is = new FileInputStream(Img);
    	    	File destFile = new File(imgPath+getISBN()+".jpg" );
    	    	 if (!destFile.getParentFile().exists()) {  
    	    	        destFile.getParentFile().mkdirs();  
    	    	}  
    	    	 
    	    	OutputStream os = new FileOutputStream(destFile);
    	    	
    	    	byte[] buffer = new byte[2048];
    	    	int length = 0;
    	    	while((length = is.read(buffer))!=-1) {
    	    		
    	    		os.write(buffer, 0, length);
    	    	}
    	    	is.close();
    	    	os.flush(); 
    	    	os.close();
    		}
    	}
    	catch(IOException e) {
    		e.printStackTrace();
			return "error";
    	}
		DBconnection conn = new DBconnection();
		if (conn.insertBook(getISBN().trim(), getTitle().trim(), getPublisher().trim(), getPublishDate(), getPrice(), getName().trim()) == true) {
			if (conn.getFlag() == true) return "success";
			else {
				
				request.setAttribute("auName", getName());
				return "input";
			}
		}
		else return "error";
	}
	
	public String update() throws SQLException {
		DBconnection conn = new DBconnection();
		if (conn.update(getISBN().trim(), getName().trim(), getPublisher().trim(), getPublishDate(), getPrice()) == true) {
			if (conn.getFlag() == true) return "success";
			else {
				HttpServletRequest request = ServletActionContext.getRequest();
				request.setAttribute("auName", getName());
				return "input";
			}
		}
		else return "error";
	}
	
	public String updateAuthor() throws SQLException {
		DBconnection conn = new DBconnection();
		
		if (conn.updateAuthor(getName().trim(),getAge(), getCountry().trim()) == true) return "success";
		else return "error";
	}
}
	
	
