<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "/struts-tags" prefix = "s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Details</title>
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
				width:60%;
				align: center
				}
				
		.left{margin-left:50px; font: 18px "Trebuchet MS", Arial, Helvetica, sans-serif; color:white; }
	    .right{margin-left:250px;font: 18px "Trebuchet MS", Arial, Helvetica, sans-serif;color:white; }
		
		#table1 {
			margin-left:50px;
		}
		#table1 tr {
			font: 18px "Trebuchet MS", Arial, Helvetica, sans-serif;
			color:white;
			padding : 20px;
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
	<h1>Detail Info...</h1>
	<s:iterator id = "author" value="%{#request.authorInfo}">
		<div class="left">
			<br>Author: <s:property value="#author.get(\"Name\")"></s:property>
			<br>Author ID: <s:property value="#author.get(\"AuthorID\")"></s:property>
			<br>Age: <s:property value="#author.get(\"Age\")"></s:property>
			<br>Country: <s:property value="#author.get(\"Country\")"/>	<br>
		</div>
	</s:iterator>
	
	<s:iterator value="%{#request.booklist}" id="bl" status = "bn"> 
			<table id="table1">
			<tr><td>
			<s:set name="path" scope="page" value="#bl.get(\"bookImage\")"/>
			<% 
			java.net.URL httpurl = null;
			Boolean result = true;
			try {
			String projectPath = request.getSession().getServletContext().getRealPath("/");
			String path = (String)pageContext.getAttribute("path");
			java.io.File file = new java.io.File(projectPath+path);
			System.out.println(path);
			if(file.exists()) result = true;
			else result = false;
			} catch (Exception e) {
			result = false;
			}
			%>
			<%
			if(result){ %> 
            <img src = <s:property value="#bl.get(\"bookImage\")"></s:property> width="135px" >
            <% }else { %> <img src ="images/default_bookImg.jpg" width="135px" >
            <% } %></td>
			<td>Title: <s:property value="#bl.get(\"Title\")"></s:property>
			<br>ISBN: <s:property value="#bl.get(\"ISBN\")"></s:property>
			<br>Publisher: <s:property value="#bl.get(\"Publisher\")"></s:property>
			<br>Publish Date: <s:property value="#bl.get(\"PublishDate\")"></s:property>
			<br>Price: <s:property value="#bl.get(\"Price\")"></s:property>
			<br><s:a href="bookUpdate.jsp?ISBN=%{#bl.get(\"ISBN\")}" style="color:#C0E1FF">
    		update</s:a>
			</td>
			</table>
			</s:iterator>
    		
</body>
</html>