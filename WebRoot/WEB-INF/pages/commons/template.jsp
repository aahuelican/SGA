<%@ page language="java" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	<title>
		<tiles:getAsString name="title" />
	</title>

<%-- Prevencion del cache --%>
<%
    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server
    response.setHeader("Cache-Control", "no-store");
%>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css"
		href="<html:rewrite page='/resources/estilos.css' />" />
		
	<script 
		language="javascript" 
		src="<html:rewrite page='/resources/funciones.js' />"></script>
		

</head>
<body>
	<div id="wrap">
		<div id="header">	
			<tiles:insert attribute="header" />
		</div>

		<div id="nav">
			<tiles:insert attribute="menu" />
		</div>

		<div id="msg">
			<tiles:insert attribute="msg" />
		</div>

		<div id="main">

			<tiles:insert attribute="body" />

		</div>
		<div id="footer">
			<tiles:insert attribute="footer" />
		</div>
	</div>
</body>
</html:html>

