<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<div class="der">
	<logic:notEmpty name="usuario">
    Bienvenido
</logic:notEmpty>
</div>


<div class="izq">
	<html:link action="inicio">Inicio</html:link>
	&nbsp;

	<logic:notEmpty name="usuario">
    &nbsp;
		<html:link action="logout">
			Salir
		</html:link>
	</logic:notEmpty>
</div>

