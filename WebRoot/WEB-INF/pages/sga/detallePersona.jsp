<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<div class="formulario">

	<div class="subtitulo">
		Detalle Persona
	</div>

	<html:form styleId="form1" action="persona">

		<!--nos va a servir para que javascript tome el valor dinamicamente
        del nombre de la aplicacion-->
		<input type="hidden" name="contexto" id="contexto"
			value="${pageContext.request.contextPath}" />

		<!--Id persona. Si estamos editando, reenviamos el id_persona al servidor
        Esto nos permitirá distinguir si estamos Agregando(insert) o
        modificando (update) -->

        <html:hidden property="idPersona" />

		<table align="center" class="elemento">
			<tr>
				<td>Nombre:</td>
				<td><html:text property="nombre" /></td>
				<td><html:errors property="nombre" /></td>
			</tr>
			<tr>
				<td>Apellido:
				</td>
				<td><html:text property="apellido" /></td>
				<td><html:errors property="apellido" /></td>
			</tr>
		</table>

		<html:submit property="operation" value="guardar" />
	</html:form>

</div>
