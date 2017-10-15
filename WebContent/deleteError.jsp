<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "/struts-tags" prefix = "s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>error</title>
<style type="text/css">
body { background: url(images/backImage1.jpg);}
		body {margin:0;}
			h1 {
				font: 24px "Trebuchet MS", Arial, Helvetica, sans-serif;
				padding: 10px 10px 10px 20px;
				display: block;
				background: #C0E1FF;
				margin-top:80px;
				}
				
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
		<h1>Error appears... try again</h1>
</body>
</html>