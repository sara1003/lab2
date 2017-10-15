<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "/struts-tags" prefix = "s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>retrieve result</title>
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
			
			.active {
			    background-color: #4CAF50;
			}
			
			#table1 {
				margin-left:50px;
			}
			#table1 tr {
				font: 18px "Trebuchet MS", Arial, Helvetica, sans-serif;
				color:white;
				padding : 20px;
				text-align:center;
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
		<h1>Author:  <s:property value="%{#request.auName}" /></h1>
		<s:iterator value="%{#request.booklist}" id="bl" status="bn" > 
			<table><tr><td>
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
             <% }else { %> 
             <img src ="images/default_bookImg.jpg" width="135px" >
   			 <% } %></td>
			<td><font color=#C0E1FF>Title: <a href="<s:url action = "retrieveDetial?ISBN=%{#bl.get(\"ISBN\")}&Name=%{#request.auName}"/>" 
			style="color:#C0E1FF;text-decoration:none;">
    		<s:property value="#bl.get(\"Title\")"></s:property></a></font><br>
    		<a href="
    		<s:url action = "deleteBook?ISBN=%{#bl.get(\"ISBN\")}"></s:url>"
    		style="color:#C0E1FF">delete</a></td></tr></table>
    	</s:iterator>	
	</body>	  
</html> 