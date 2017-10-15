<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "/struts-tags" prefix = "s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Author</title>
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
			
				margin-top: 100 px;
				margin-left:auto;
				margin-right:auto;
				max-width: 1000px;
				
				font: 12px Arial, Helvetica, sans-serif;
				color: #8E8E8E;
			}
			
			.addform h1 {
				font: 24px "Trebuchet MS", Arial, Helvetica, sans-serif;
				padding: 10px 10px 10px 20px;
				display: block;
				background: #C0E1FF;
				margin-top:80px;
				}
			
			.addform label{
			display: block;
			margin: 0px 0px 5px;
			color:#FFFFFF;
			font-size:12pt;
			}
				
			.addform s:textfield{
				font-color:white;
				font-family:sans-serif
			}
				
			.addform input[type="text"]{
				color: #888;
				width: 60%;
				padding: 0px 0px 0px 5px;
				border: 1px solid #C5E2FF;
				background: #FBFBFB;
				outline: 0;
				box-shadow: inset 0px 1px 6px #ECF3F5;
				font: 200 12px/25px Arial, Helvetica, sans-serif;
				height: 30px;
				line-height:15px;
				margin: 2px 6px 16px 0px;
				align: center;
				}
			.addform button {
				background: #999999;
				border: none;
				padding: 10px 25px 10px 25px;
				color: #FFF;
				box-shadow: 1px 1px 5px #B6B6B6;
				border-radius: 3px;
				text-shadow: 1px 1px 1px #222222;
				cursor: pointer;
				}
		   .addform button:hover {
				background: #222222
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
		
	<s:form action = "updateAuthor" class="myLib.BookCrud"  method = "post"  cssClass="addform" theme="css_xhtml">
		<h1>The author is not in our lib, fill in his infor...</h1>
		<s:textfield type="hidden" name="Name" value="%{#request.auName}"/>
		<s:textfield name = "Age" label = "Age" placeholder="for example: 56"></s:textfield>
		<s:textfield name = "Country" label = "Country" placeholder="for example: U.S."></s:textfield>
		<s:submit type="button" value="submit"/>
	</s:form>
</body>
</html>