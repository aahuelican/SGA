
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<div class="subtitulo">
	Login Sistema SGA
</div>

<div class="formulario">
	 
		<html:form action="login" onsubmit="return validateLoginForm(this);">
			<table align="center" class="elemento" >
				<tr>
					<td>
						<bean:message key="forma.usuario"/>:
					</td>
					<td>
						<html:text property="usuario" size="10"/>
					</td>
					<td>
						<html:errors property="usuario" />
					</td>
				</tr>
				<tr>
					<td>
						<bean:message key="forma.password"/>:
					</td>
					<td>
						<html:password property="password" size="10"/>
					</td>
					<td>
						<html:errors property="password" />
					</td>
				</tr>
			</table>
			
			<html:submit>
   			<bean:message key="forma.submit"/>
   		</html:submit>

		</html:form>
		
		<%--Activamos la validacion del lado del cliente --%>
		<html:javascript formName="loginForm"/>
		
</div>