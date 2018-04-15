<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C" %>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="#">LMS</a>
  
  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="/">All Books</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="newBook">New Book</a>
    </li>
  </ul>
</nav>

<div class="container" style="align:center">

<C:choose>
<C:when test="${mode == 'BOOK_VIEW'}">
<table class="table table-dark">
    <thead>
      <tr>
        <th>Id</th>
        <th>Book Name</th>
        <th>Author</th>
        <th>Purchase Date</th>
        <th>Edit</th>
        <th>Delete</th>
      </tr>
    </thead>
    <tbody>
      <C:forEach var="Book" items="${Books}">
      		<tr>
      			<td>${Book.id}</td>
      			<td>${Book.bookName}</td>
      			<td>${Book.author}</td>
      			<td>${Book.purchaseDate}</td>
      			<td><a href="updateBook?id=${Book.id}"><i class="fa fa-pencil"></i></a></td>
      			<td><a href="deleteBook?id=${Book.id}"><i class="fa fa-trash"></i></a></td>
      		</tr>
      </C:forEach>
    </tbody>
  </table> 
  </C:when>
  <C:when test="${mode == 'BOOK_EDIT' || mode == 'BOOK_NEW'}">
	  <form action="save" method="POST" name="book">
	  <input type="hidden" class="form-control" value="${book.id}" name="id" id="id">
		  <div class="form-group">
		    <label for="bookName">Book Name:</label>
		    <input type="text" class="form-control" id="bookName" name="bookName" value="${book.bookName}">
		  </div>
		  <div class="form-group">
		    <label for="author">Author:</label>
		    <input type="text" class="form-control" id="author" name="author" value="${book.author}">
		  </div>
		  <div class="form-group">
		    <label for="purchaseDate">Purchase Date:</label>
		      <input type="date" class="form-control" id="purchaseDate" name="purchaseDate" value="${book.purchaseDate}"> 
		  </div>
		  <button type="submit" class="btn btn-primary">Submit</button>
	</form>
  
  </C:when>
 </C:choose>
</div>
</body>
</html>