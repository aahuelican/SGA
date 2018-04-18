<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<html:form styleId="form1" action="persona">

	<div class="subtitulo">
		Listado de Personas
	</div>

	<logic:notEmpty name="personas">

		<div class="tabla">
			<table align="center" class="elemento">
				<tr>
					<th>
						<input type="checkbox" name="controladorCheckbox"
							onclick="selectAllCheckboxes(this);" />
					</th>
					<th>Nombre</th>
					<th>Apellido</th>
				</tr>

				<logic:iterate id="persona" name="personas" indexId="row">
					<tr class="${ (row % 2) == 0 ? "row1" : "row2" }" >
						<td align="center">
							<input type="checkbox" name="personas" id="personas"
								value="${persona.idPersona}">
						</td>
						<td onclick="editaRegistro(${row});">
							<bean:write name="persona" property="nombre" />
						</td>
						<td onclick="editaRegistro(${row});">
							<bean:write name="persona" property="apellido" />
						</td>
					</tr>

				</logic:iterate>

			</table>

			<html:submit styleId="botonAgregar" property="operation" value="agregar"/>

			<html:submit styleId="botonEditar" property="operation"
				value="editar"
				onclick="return validaFormularioListadoPersonas(this);" />

			<html:submit styleId="botonEliminar" property="operation"
				value="eliminar"
				onclick="return validaFormularioListadoPersonas(this);" />


			<%-- 
			<input id="botonAgregar" type="button" value="agregar"
				onclick="validaFormularioListadoPersonas(this);">
		
			<input id="botonEditar" type="button" value="editar"
				onclick="validaFormularioListadoPersonas(this);">
			<input id="botonEliminar" type="button" value="eliminar"
				onclick="validaFormularioListadoPersonas(this);">
			--%>
		</div>
	</logic:notEmpty>
	
	<logic:empty  name="personas">
         <div align="center">	
         	No existen elementos en la lista 
         	<br/>
         	<html:submit styleId="botonAgregar" property="operation" value="agregar"/>
  				</div>
  </logic:empty>
</html:form>
