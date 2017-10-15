<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "/struts-tags" prefix = "s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Help</title>
	<style type="text/css">
		body { background: url(images/backImage1.jpg);}
		body {margin:0;}

			ul {
			    list-style-type: none;
			    margin: 0;
			    padding: 0;
			    overflow: hidden;
			    background-color: #333;
			    position: fixed;
			    top: 0;
			    width: 100%;
			}
			
			li a {
			    display: block;
			    color: white;
			    text-align: center;
			    padding: 14px 16px;
			    text-decoration: none;
			}
			
			li a:hover:not(.active) {
			    background-color: #111;
			} 
			
			.active {
			    background-color: #4CAF50;
			}
			
			
			h1 {
				font: 24px "Trebuchet MS", Arial, Helvetica, sans-serif;
				padding: 10px 10px 10px 20px;
				display: block;
				background: #C0E1FF;
				margin-top:80px;
				width:70%
				}
			
			div{
				font: 18px "Trebuchet MS", Arial, Helvetica, sans-serif;
				padding: 10px 10px 10px 20px;
				margin-top:30px;
				width:70%;
				color:#C0E1FF
			}
			
			div img{
				width:70%;
				border-color:#FFFFFF;
				border-width:1px;
				border-style:solid
			}
			</style>
</head>
<body>
		<ul>
		  <li><img src = images/myLib.jpg width="120px" style="float:left" ></li>
		   <li><a href="help.jsp" style="float:right">help</a></li>
		   <li><a href="addBooks.jsp" style="float:right">Add books</a></li>
		   <li> <s:form action = "retriveBook" class="myLib.BookCrud"  method = "post" style="float:right;margin-top:10px;"  theme="simple" align="center" >
					<s:textfield name = "Name" action = "retriveBook" class="myLib.BookCrud" align="center" placeholder="type author name" style="height:20px;width:200px;font-size:15px;border-radius:10px" /> 
					<s:submit type="button" value="search"/>
			   </s:form>
			</li>
		</ul>
		
		<h1> Help...</h1>
		<div>
		<br> This is an open project.
		<br> Our aim is to build a library with everyone's effort.
		<br> Here, you can search a book by their user, update and delete it, Also you can add a new book.
		<br> <img src = "images/1.jpg"/>
		<br> First, type the author: for example : Gabriel Tallent, and you will see the this:
		<br> <img src = "images/2.jpg"/>
		<br> Here, you can click the Title for the detail information about the book and author, also, if you want to delete the book, click delete
		<br> The detail information:
		<br> <img src = "images/3.jpg"/>
		<br> Here, you can click the "update" button to update author, Publisher, Publish Date, Price of the book, if you select an author not in this Lib
		<br> You will be asked to fill the form below
		<br> <img src = "images/4.jpg"/>
		<br> <img src = "images/5.jpg"/>
		<br> Did you see the add the book button? click to add a nwe book to the Lib.
		<br> Also, if you select an author not in this Lib You will be asked to fill the form 
		<br> <img src = "images/6.jpg"/>
		</div> 
</body>
</html>