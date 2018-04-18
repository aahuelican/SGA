/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package sga.web.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import sga.eis.dto.Persona;
import sga.services.PersonaService;
import sga.services.impl.PersonaServiceImpl;
import sga.web.form.PersonaForm;

/**
 * MyEclipse Struts Creation date: 07-14-2010
 * 
 * XDoclet definition:
 * 
 * @struts.action
 */
public class PersonaAction extends DispatchAction {
	/*
	 * Generated Methods
	 */

	/**
	 * Method execute
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward listar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		// Revisamos si ya esta el usuario en session
		HttpSession session = request.getSession();
		String usuario = (String) session.getAttribute("usuario");

		if (usuario != null) {
			// Si ya existe un usuario en session, lo redireccionamos a la lista
			// de personas

			// Recuperamos el listado de personas, utilizamos el servicio de
			// Personas
			PersonaService personaService = PersonaServiceImpl.getInstance();
			List<Persona> personas = personaService.getAllPersonas();

			// Si se encontraron personas, las compartimos en la pagina Web
			if (personas != null && personas.size() > 0) {
				request.setAttribute("personas", personas);
			}
			return mapping.findForward("listarPersonas");
		} else {
			return mapping.findForward("login");
		}
	}
	
	public ActionForward editar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		//Recuperamos la forma
	  	PersonaForm personaForm  = (PersonaForm) form;
		
		String mensaje = null;

	    //Recuperamos el identificador a procesar y reenviamos a la pagina de detalle
	    String idPersonaParam = request.getParameter("personas");
	    Integer idPersona = null;

	    if (idPersonaParam != null && !idPersonaParam.trim().equals("")) {
	      idPersona = new Integer(idPersonaParam);

	      //Utilizamos el servicio de persona para recuperar el objeto de la BD
	      PersonaService personaService = PersonaServiceImpl.getInstance();
	      Persona persona = personaService.getPersonaById(idPersona);

	      //Llenamos el formbean
	      personaForm.setIdPersona( persona.getIdPersona() );
	      personaForm.setNombre( persona.getNombre() );
	      personaForm.setApellido( persona.getApellido() );
	      
	      return mapping.findForward("detallePersona");

	    } else {
	      mensaje = "Debe seleccionar un elemento a Editar";
	      request.setAttribute("mensaje", mensaje);
	      //Reutilizamos el caso de listarPersonas
	      return mapping.findForward("listarPersonas");
	    }
	
	}
	
	public ActionForward agregar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

			return mapping.findForward("detallePersona");
	
	}
	
	public ActionForward guardar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		  	String mensaje = null;
		  	
		  	//Recuperamos la forma
		  	PersonaForm personaForm  = (PersonaForm) form;
		  	
		    //1. Utilizamos el objeto Modelo
		    Persona persona = new Persona();
		    persona.setIdPersona( personaForm.getIdPersona()); //si no venia en los parametros, se coloca null
		    persona.setNombre( personaForm.getNombre() );
		    persona.setApellido( personaForm.getApellido() );

		    //2. Utilizamos la capa de servicio
		    PersonaService personaService = PersonaServiceImpl.getInstance();
		    boolean elementoGuardado = personaService.guardarPersona(persona);

		    //3. Redireccionamos dependiendo del resultado
		    if (elementoGuardado) {
		      mensaje = "Se guard&oacute; el elemento correctamente";
		    } else {
		      mensaje = "No se guardo correctamente el elemento";
		    }

		     request.setAttribute("mensaje", mensaje);

		     //listamos nuevamente, reutilizamos la funcion de listar
		     return this.listar(mapping, personaForm, request, response);
		     
	}

	public ActionForward eliminar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		 String mensaje = null;

		    //1. Procesamos los parametros
		    //Recuperamos TODOS los objetos seleccionados
		    String[] idPersonaParams = request.getParameterValues("personas");
		    List<Integer> idPersonas = new ArrayList<Integer>();

		    //2. Utilizamos los objetos de Modelo (Persona)
		    //Validamos los parametros a eliminar
		    if (idPersonaParams != null && idPersonaParams.length > 0) {
		      for (String persona : idPersonaParams) {
		        idPersonas.add(new Integer(persona));
		      }

		      //3.Utilizamos la capa de servicio para eliminar los objetos
		      PersonaService personaService = PersonaServiceImpl.getInstance();
		      boolean registrosEliminados = personaService.eliminarPersonas(idPersonas);

		      if (registrosEliminados) {
		        mensaje = "Se eliminaron correctamente los registros";
		      }
		    } else {
		      mensaje = "Debe seleccionar uno o varios elementos a Eliminar";
		    }

		    //4. Redireccionamos al listado de personas (ya no debe de mostrar los registros eliminados)
		    request.setAttribute("mensaje", mensaje);


		    //listamos nuevamente, reutilizamos la funcion de listar
		     return this.listar(mapping, form, request, response);
		     
	}
}