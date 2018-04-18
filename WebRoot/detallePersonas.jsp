<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 
<html> 
	<head>
		<title>JSP for PersonaForm form</title>
	</head>
	<body>
		<br>
		<html:form action="/[ACTION_PATH]">
			apellido : <html:text property="apellido"/><html:errors property="apellido"/><br/>
			nombre : <html:text property="nombre"/><html:errors property="nombre"/><br/>
			<html:submit/><html:cancel/>
		</html:form>
	</body>
</html>

