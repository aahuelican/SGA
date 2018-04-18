package sga.web;

import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ExceptionHandler;
import org.apache.struts.config.ExceptionConfig;

public class ManejadorException extends ExceptionHandler {
	public ActionForward execute(Exception ex, ExceptionConfig config,
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws ServletException {

			//Simplemente imprimimos el error y lo compartimos como objetos

			StringWriter sw = new StringWriter();
			ex.printStackTrace(new PrintWriter(sw));
			String stacktrace = sw.toString();
			request.setAttribute("excepcion", ex.getMessage());
			request.setAttribute("traza", stacktrace);
			
			//Imprimimos la excepcion en la consola
			ex.printStackTrace();
			
		// Normalmente termina haciendo una llamada a super.execute
		return (super.execute(ex, config, mapping, form, request, response));
	}

}
