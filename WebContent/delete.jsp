<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,java.sql.*,SRC.DataBase,SRC.Entity"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
div {
	min-width: 200px;
	width: 100%;
	height: 200px;
}
</style>
<script>
	function deleteItem() {
		var frm = document.getElementById("AddInformation");
		frm.submit(); //Submit the form
		window.location.assign("finish.jsp");    
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8"); //So that the data from form would also be encoded
	%>
	<div align="center">
		<h3>Delete an existed book</h3>
		<form id="AddInformation">
			<p>
				Book Name: <br> <input type="text" name="name" value="" />
			</p>
			<p>
				Author: <br> <input type="text" name="author" value="" />
			</p>
		
			<p>
				<input type="button" value="OK" name="OK" onclick='deleteItem()'>
				<input type="button" value="Cancel" name="Cancel" onclick='close()'>

				<%
					String name = request.getParameter("name");
							String author = request.getParameter("author");

						if (name != null && author != null) {
						DataBase db = new DataBase();
						db.deleteEntity(name, author);
					}

					//pageContext.setAttribute("name", name);
				%>
			</p>
		</form>
	</div>

</body>
</html>