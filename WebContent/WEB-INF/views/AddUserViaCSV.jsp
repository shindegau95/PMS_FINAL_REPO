
<!--
 Filename : AddUserViaCSV.jsp
 Author name: Crystal Cuthinho
 Description: used for adding users via csv file at the beginning of the year by tpo/ admin. Mapping goes to AddUserController.
 -->

<!-- author: Pankaj sankpal
description: contains links to manage system users->
<!-- -------------------------------------------------------------------------------------------------------- -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.error {
	color: #ff0000;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Add User via Csv file..</title>

<meta name="description" content="overview &amp; stats" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="../assets/font-awesome/4.2.0/css/font-awesome.min.css" />

<!-- page specific plugin styles -->
<link rel="stylesheet" href="assets/css/jquery-ui.custom.min.css" />



<!-- text fonts -->
<link rel="stylesheet" href="../assets/fonts/fonts.googleapis.com.css" />

<!-- ace styles -->
<link rel="stylesheet" href="../assets/css/ace.min.css"
	class="ace-main-stylesheet" id="main-ace-style" />





<!-- inline styles related to this page -->

<!-- ace settings handler -->
<script src="../assets/js/ace-extra.min.js"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->


</head>
<body 	onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="">
	<jsp:directive.include file="Header.jsp" />

	<div class="main-content">
				<div class="main-content-inner">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<!-- <ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Home</a>
							</li>

							<li>
								<a href="#">More Pages</a>
							</li>
							<li class="active">User Profile</li>
						</ul>/.breadcrumb -->

						<div class="nav-search" id="nav-search">
							<form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="on" />
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
							</form>
						</div><!-- /.nav-search -->
					</div>

					<div class="page-content">
						

						<div class="page-header">
							<h1>
								Logged in as
								<c:out value="${sessionScope.name}" />
							</h1>
						</div><!-- /.page-header -->
						<br><br>
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="clearfix">
										<c:if test="${success==1}">
															<p style="color:green;">Users added successfully!</p>
														</c:if>
										<div class="row">
										<div class="col-xs-12 col-lg-6">
										<div class="widget-box">
										<div class="widget-body">
										 <div class="widget-main">
											<div>
											 &nbsp;&nbsp; <b >Upload CSV file...! </b>
												<form:form method="post" modelAttribute="fileUpload1" enctype="multipart/form-data" action="uploadFile">
												<!--  Enter year of passing:   <input id="year" name="year" type="text" value=""/><br/><br/>-->
												
												<form:errors path="*" cssClass="errorblock" element="div" />
														File to upload: <input class="btn btn-sm btn-primary" type="file" name="fileUpload"><br />
														
														<c:if test="${error==1}">
															<p style="color:red;">Failed to upload...File format can be .csv only!</p>
														</c:if>
														<c:if test="${error1==1}">
															<p style="color:red;">Failed to upload...File size can be only upto 1MB</p>
														</c:if>
														  <input class="btn btn-sm btn-warning" type="submit" value="Upload"> Press here to upload the file!
														  <span><form:errors path="file" cssClass="error" />
															</span>
												</form:form>
											</div>
											</div>
											</div>
											</div>
										</div>

										<div class="col-xs-12 col-lg-6">
										<div class="widget-box">
										<div class="widget-body">
										 <div class="widget-main">
											<div>
												<table align="center">
												
													
													<tr>
														<td>To manage the users manually</td>
													</tr>
													<tr>
														<td>1. <a href="addstudent.html">Add Student</a></td></tr>
												    <tr>
														<td>2. <a href="addfaculty.html">Add Faculty</a></td>	</tr>
													<tr>
														<td>3.<a  href="removeuser">Remove User</a><br/></td>
													</tr>
													<tr>
														<td>4.<a href="InsertWork.html">Assign Task</a><br/></td>
													</tr>
													
													<tr>
														<td>5.<a href="searchHome">Search company/Student </a><br/></td>
													</tr>
												</table>
												<br>
											</div>
										  </div>
										  </div>
										  </div>
										</div>
									</div>
										
								
								
								</div>
							</div>
						</div>
					</div>
				</div>
												
	

	
		
		<jsp:directive.include file="Footer.jsp" />
	<jsp:directive.include file="scripts.jsp" />
	
		<!-- /.main-container -->

</div>
	
	


</body>
</html>


<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
.error {
	color: #ff0000;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload CSV</title>
</head>
<body>




<form:form method="post" modelAttribute="fileUpload1" enctype="multipart/form-data" action="uploadFile">

<!-- <form method="POST" enctype="multipart/form-data" action="uploadFile"> -->

 <!--  Enter year of passing:   <input id="year" name="year" type="text" value=""/><br/><br/> -->
	<form:errors path="*" cssClass="errorblock" element="div" />
		File to upload: <input type="file" name="fileUpload"><br />
		
		<c:if test="${error==1}">
			<p style="color:red;">Failed to upload...File format can be .csv only!</p>
		</c:if>
		<c:if test="${error1==1}">
			<p style="color:red;">Failed to upload...File size can be only upto 1MB</p>
		</c:if>
		  <input type="submit" value="Upload"> Press here to upload the file!
		  <span><form:errors path="file" cssClass="error" />
		</span>
	</form:form>
	<br/><br/>
	
</body>
</html> --%>


