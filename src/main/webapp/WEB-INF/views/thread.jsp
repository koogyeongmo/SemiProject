<link href="<%=request.getContextPath()%>/resources/css/common/reset.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/wrapper.css" rel="stylesheet">

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Thread</title>
	    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	    

	</head>
	<body>
		<div class="sidebar_wrapper">
			<%@include file="/WEB-INF/views/common/sidebar.jsp" %>
		</div>
		
		<div class="page_wrapper">
			<%@include file="/WEB-INF/views/thread/thread_body.jsp" %>
		
		</div>
	</body>
</html>