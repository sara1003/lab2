<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "/struts-tags" prefix = "s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Add new books</title>
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
			
			.addform input[type="file"] {
			    
			    font-size: 20px;
			    right: 0;
			    top: 0;
			    cursor: pointer;
			    height: 30px;
			    width:60%
			}

			.addform input[type="file"]:hover {
			    color: #444;
			    background: #eee;
			    border-color: #ccc;
			    text-decoration: none
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
		
	<s:form action = "addBook" namespace="/" class="myLib.BookCrud" cssClass="addform" theme="css_xhtml" method = "post" enctype="multipart/form-data">
		<h1>Add a book</h1>
		<br><label>Select a book image</label><br>
		<s:file id="upload" theme="simple" name="Img"  accept="image/jpg,image/jpg"></s:file>
		<s:textfield name = "Title" label = "Title" placeholder="for example:Hi tomorrow!"></s:textfield>
		<s:textfield name = "ISBN" label = "ISBN" placeholder="for example:810-234912637"></s:textfield>
		<s:textfield name = "Name" label = "Author" placeholder="for example:Tomas Show"></s:textfield>
		<s:textfield name = "Publisher" label = "Publisher" placeholder="for example:Center Press"></s:textfield>
		<s:textfield name = "PublishDate" label = "Publish Date" placeholder="for example:2001-01-01"></s:textfield>
		<s:textfield name = "Price" label = "Price" placeholder="for example (unit:USD):18.27"></s:textfield>
		<s:submit type="button" value="submit"/>
	</s:form>

</body>
</html>