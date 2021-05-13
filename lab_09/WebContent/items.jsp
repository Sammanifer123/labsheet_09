<%@page import="lab_09.item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
 
if (request.getParameter("itemCode") != null){
	
	 item itemObj = new item(); 
	 String stsMsg = "";
	
	 
	//insert items	 
	if (request.getParameter("hidItemIDSave") == ""){	 
		 
			 stsMsg = itemObj.insertItem(request.getParameter("itemCode"), 
							 request.getParameter("itemName"), 
							 request.getParameter("itemPrice"), 
							 request.getParameter("itemDesc")); 
	 }
	
	//update
	else{
			stsMsg = itemObj.updateItem(request.getParameter("hidItemIDSave"),
							 request.getParameter("itemCode"), 
							 request.getParameter("itemName"), 
							 request.getParameter("itemPrice"), 
							 request.getParameter("itemDesc"));			
	 }
	
	 session.setAttribute("statusMsg", stsMsg); 
	 
}
//Delete items
	if (request.getParameter("hidItemIDDelete") != null) {
		
		 item itemObj = new item(); 
		 String stsMsg = itemObj.DeleteItem(request.getParameter("hidItemIDDelete")); 
		 session.setAttribute("statusMsg", stsMsg); 
	 } 
%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
<link rel="stylesheet" href="Views/bootstrap.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/items.js"></script>
</head>
<body>
<div class="container">
<div class="row justify-content-center">
<h1>Items Management</h1>
</div>

        <div class="col-bs-6">
          <div class="well bs-component">
        
<form method="post" action="items.jsp">
<div class="form-group row">
Item code: <input name="itemCode" class="form-control" type="text"><br>
</div>
<div class="form-group row">
Item name: <input name="itemName" class="form-control" type="text"><br>
</div>
<div class="form-group row">
Item price: <input name="itemPrice"  class="form-control" type="text"><br>
</div>
<div class="form-group row">
Item description: <input name="itemDesc" class="form-control" type="text"><br>
</div>
<input name="btnSubmit" type="submit" class="btn btn-primary btn-lg btn-block" value="Save">
</form>

</div>
</div>
</div>
<div class="alert alert-success">
<%
out.print(session.getAttribute("statusMsg"));
%>
</div>
<br>

<%
item itemObj = new item();
out.print(itemObj.readItems());
%>



</body>
</html>