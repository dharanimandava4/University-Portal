<html><head>

<meta charset="UTF-8">
<title>Admin Page</title>
</head>
<body  style="
    background-color: antiquewhite;
">
	<h1 style="align:center;color: crimson;">Admin Page</h1>
	<hr>
	<form id="registerForm">
	<table style="margin-left: 37%;">
		<tbody><tr><td colspan="2"><h3 style="
    color: chartreuse;
">Student Registration Portal</h3></td></tr>
		<tr><td style="
    color: brown;
">First Name</td><td><input type="text" name="firstName"></td></tr>
		<tr><td style="
    color: brown;
">Last Name</td><td><input type="text" name="lastName"></td></tr>
		<tr><td style="
    color: brown;
">Mobile Number</td><td><input type="text" name="phoneNumber"></td></tr>
		<tr><td style="
    color: brown;
">Date of birth:</td><td><input type="text" name="dob"></td></tr>
		<tr><td style="
    color: brown;
">Address</td><td><input type="text" name="address"></td></tr>
		<tr><td style="
    color: blue;
">Department</td><td><select id="departmentId" name="departmentId"><option value="5">Aeronautical</option><option value="1">Computer Science</option><option value="3">Electrical</option><option value="2">Electronics</option><option value="4">Mechanical</option><option value="5">Aeronautical</option><option value="1">Computer Science</option><option value="3">Electrical</option><option value="2">Electronics</option><option value="4">Mechanical</option></select></td></tr>
		<tr><td colspan="2"><input type="button" value="Register Student" id="registerStudent" style="
    color: blue;
"></td></tr>
	</tbody></table>
	</form>
	
	<hr>
	<form id="studentsListForm">
	<table>
		<tbody><tr><td colspan="3"><h3>Students List Form</h3></td></tr>
		<tr><td>Department Name: </td><td><select id="deptId" name="deptId"><option value="5">Aeronautical</option><option value="1">Computer Science</option><option value="3">Electrical</option><option value="2">Electronics</option><option value="4">Mechanical</option><option value="5">Aeronautical</option><option value="1">Computer Science</option><option value="3">Electrical</option><option value="2">Electronics</option><option value="4">Mechanical</option></select></td><td><input type="button" value="Get List" id="studentListId"></td></tr>
	</tbody></table>
	</form>
	<ol id="studentListResultId">
		
	</ol>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
	<script src="/js/jquery.serializejson.js"></script>
	<script>
		$(document).ready(function(){
			function loadDepartments(){
				$.get("/web/departments",function(data){
					for(i=0;i<data.length; i++){
						$("#departmentId").append("<option value='"+data[i].departmentId+"'>"+data[i].departmentName+"</option>");
						$("#deptId").append("<option value='"+data[i].departmentId+"'>"+data[i].departmentName+"</option>");
					}
				});
			}
			loadDepartments();
			$("#registerStudent").click(function(){
				uploadData = JSON.stringify($("#registerForm").serializeJSON());
				console.log(uploadData);
				$.ajax({
					url:"/web/registerstudent",
					type:"POST",
					data:uploadData,
					contentType:"application/json",
					success:function(){
						alert("Student Registration Success")
					}
				});
			});
			
			$("#studentListId").click(function(){
				$.get("/web/studentslist/"+$("#deptId").val(), function(data){
					console.log(data);
					$("#studentListResultId").html("");
					for(i=0;i<data.length;i++){
						$("#studentListResultId").append("<li>"+data[i].firstName+ " " + data[i].lastName + " " + data[i].phoneNumber+ " "+ data[i].dob+"</li>")
					}
				})
			})
		});
	</script>

</body></html>