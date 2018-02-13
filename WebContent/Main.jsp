<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,java.sql.*,SRC.DataBase,SRC.Entity"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BookManager System</title>

<style type="text/css">
table {
	border-collapse: separate;
	border-spacing: 3px 10px;
	text-align: center;
	font-size: 20px;
	width: 800px;
}

div {
	min-width: 940px;
	width: 100%;
	height: 505px;
}

p {
	border-spacing: 3px 10px;
}
</style>

<script LANGUAGE="JavaScript">
	function openWindow(value) {
		switch (value) {
		case "Add":
			window
					.open(
							"add.jsp",
							"Add a new item",
							"height=600, width=400,top=400,left=500,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no");
			break;
		case "Delete":
			window
					.open(
							"delete.jsp",
							"Delete a exsisted item",
							"height=600, width=400,top=400,left=500,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no");
			break;
		case "Modify":
			window
					.open(
							"modify.jsp",
							"Modify a new item",
							"height=600, width=400,top=400,left=500,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no");
			break;
		case "SearchByAuthor":
			window
					.open(
							"searchByAuthor.jsp",
							"Search By Author",
							"height=600, width=400,top=400,left=500,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no");

			break;
		case "SearchByBook":
			window
					.open(
							"searchByName.jsp",
							"Modify a new item",
							"height=600, width=400,top=400,left=500,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no");

			break;
		case "Show all books":
			location.reload();
			break;
		default:
			break;
		}
	}
</script>
</head>
<body>
	<div align="center">
		<h1>Book Manage System</h1>
		<table border="0">
			<tr style="background-color: #33FFCC">
				<td>Name</td>
				<td>Author</td>
				<td>Number</td>
				<td>Price</td>
			</tr>
			<%
				DataBase db = new DataBase();
				List<Entity> list = db.getEntity();
				int odd = 0;
				for (Entity tl : list) {
					if (odd == 0) {
			%>
			<tr style="background-color: #339933">
				<td><%=tl.getName()%></td>
				<td><%=tl.getAuthor()%></td>
				<td><%=tl.getNumber()%></td>
				<td><%=tl.getPrice()%></td>
			</tr>
			<%
				odd = 1;
					} else if (odd == 1) {
			%>
			<tr style="background-color: #33FF33">
				<td><%=tl.getName()%></td>
				<td><%=tl.getAuthor()%></td>
				<td><%=tl.getNumber()%></td>
				<td><%=tl.getPrice()%></td>
			</tr>
			<%
				odd = 0;
					}
				}
			%>
		</table>
		<p align="center">
			<button type="button" value="Add" onclick="openWindow(value)">Add</button>
			<button type="button" value="Delete" onclick="openWindow(value)">Delete</button>
			<button type="button" value="Modify" onclick="openWindow(value)">Modify</button>
			<button type="button" value="SearchByAuthor"
				onclick="openWindow(value)">Search By Author</button>
			<button type="button" value="SearchByBook"
				onclick="openWindow(value)">Search By Book Name</button>
			<button type="button" value="Show all books" onclick="refresh()">Show
				All books</button>
		</p>
	</div>

</body>
</html>