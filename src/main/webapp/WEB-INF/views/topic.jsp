<link href="<%=request.getContextPath()%>/resources/css/common/reset.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/wrapper.css" rel="stylesheet">

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>topic</title>    
</head>
	<body>
	
		<div class="sidebar_wrapper">
			<%@include file="/WEB-INF/views/common/sidebar.jsp" %>
		</div>
	
		<div class="page_wrapper">
			<%@include file="/WEB-INF/views/topic/topic_body.jsp" %>
			<%@include file="/WEB-INF/views/topic/editor.jsp" %>
			
			<%@include file="/WEB-INF/views/topic/topic_info.jsp" %>
			
		</div>
		
		<script>
			function toggleMainPage() {
				editorWindow = document.getElementsByClassName("editor_container")[0];
	            threadWindow = document.getElementsByClassName("middle_column")[0];

	            if (threadWindow.style.display !== 'none') {
	            	threadWindow.style.display = 'none';
	            	editorWindow.style.display = 'block';
	              } else {
	            	  threadWindow.style.display = 'none';
	            	  editorWindow.style.display = 'block';

	              }
			}

		</script>
		
	</body>
</html>