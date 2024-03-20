<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>Todo List</h1>
	<input id="todoInput" type="text" placeholder="할 일을 넣으세요" />
	<button id="addButton">Add</button>
	<ul id="todoList">
		<!-- 할 일 목록이 여기에 추가됩니다. -->
	</ul>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
      $(function () {
		$.ajax({
			url:'GetTodos',
			method:'GET',
			success: function(data){
				addItem(data);
			}
		});
      });
      
      function addItem(data) {
    	  const list = $('#todoList');
    	  
    	  const item = $('<li></li>').text(data);
    	  const removeButton = $('<button></button>').text('Remove');
    	  removeButton.click(function(){
    	  $.ajax({
  			url:'RemoveTodo',
  			method:'POST',
  			data : {
  				text : data
  			},
  			success: function(){
  				item.remove();
  			}
    	  });
  		});
    	  
    	  
    	  item.append(removeButton);
    	  list.append(item);
      }
    </script>
</body>
</html>