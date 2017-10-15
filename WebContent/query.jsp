<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "/struts-tags" prefix = "s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Query books</title>
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
			
			.addform{
			
				
			}
			
			.addform h1 {
				font: 24px "Trebuchet MS", Arial, Helvetica, sans-serif;
				padding: 10px 10px 10px 20px;
				display: block;
				background: #C0E1FF;
				margin-top:80px;
				width:70%
				}
				
			.addform s:textfield{
				font-color:white;
				font-family:sans-serif
			}
				
			.addform input[type="text"]{
				color: #888;
				width: 400px;
				padding: 0px 0px 0px 5px;
				border: 1px solid #C5E2FF;
				background: #FBFBFB;
				outline: 0;
				box-shadow: inset 0px 1px 6px #ECF3F5;
				font: 200 12px/25px Arial, Helvetica, sans-serif;
				height: 30px;
				line-height:15px;
				margin-top:50px;
				align: center;
				margin-left: 100px;
				border-radius: 10px;
				
				}
			.addform button {
				background: #999999;
				border: none;
				color: #FFF;
				height: 30px;
				box-shadow: 1px 1px 5px #B6B6B6;
				border-radius: 4px;
				text-shadow: 1px 1px 1px #222222;
				cursor: pointer;
				
				}
		   .addform button:hover {
				background: #222222
				}
				
			div{
				font: 18px "Trebuchet MS", Arial, Helvetica, sans-serif;
				padding: 10px 10px 10px 20px;
				margin-top:100px;
				width:70%;
				color:#C0E1FF
			}
		</style>
	</head>
	<body>
		<ul>
		  <li><img src = images/myLib.jpg width="120px" style="float:left" ></li>
		   <li><a href="help.jsp" style="float:right">help</a></li>
		   <li><a href="addBooks.jsp" style="float:right">Add books</a></li>
		</ul>
		
		<s:form action = "retriveBook" class="addform" theme="simple"  method = "post" style=""   >
			<h1>Start with typing the author name and click search...</h1>
			<s:textfield name = "Name" placeholder="for example: Lisa Wingate"  />
			<s:submit type="button" value="search"/>
		</s:form>
		
		<div>
		<br> This is an open project.
		<br> Our aim is to build a library with everyone's effort.
		<br> Here, you can search a book by their user, update and delete it, Also you can add a new book.
		<br> Click help , you may find some tips for some operators.
		<br> Please make sure your changes made to the book are correct.
		<br> Thanks you all.
		</div>
		
		
	</body>
</html>

