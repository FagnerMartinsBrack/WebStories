package org.webstories.web.convention.pages.home.projects;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.webstories.core.auth.Logged;
import org.webstories.core.security.AccessDeniedException;
import org.webstories.core.story.facade.LocalStoryManip;
import org.webstories.core.validation.ValidationException;
import org.webstories.web.util.params.RequestParams;
import org.webstories.web.util.servlet.AuthForwarded;
import org.webstories.web.util.servlet.BaseServlet;
import org.webstories.web.util.servlet.HttpInternalServerErrorException;
import org.webstories.web.util.servlet.HttpUnauthorizedException;

import com.fagnerbrack.servlet.convention.ConventionServlet;

@WebServlet
@ConventionServlet
@AuthForwarded
@SuppressWarnings( "serial" )
public class DeleteAction extends BaseServlet {
	@EJB
	LocalStoryManip storyEditor;
	
	@Override
	protected void doPost( HttpServletRequest request, HttpServletResponse response )
	throws HttpInternalServerErrorException, HttpUnauthorizedException {
		RequestParams params = RequestParams.from( request );
		long idStory = params.get( "id" ).toLong();
		Logged logged = getLogged( request );
		try {
			storyEditor.removeStory( idStory, logged );
			response.sendRedirect( request.getHeader( "referer" ) );
		} catch ( ValidationException | AccessDeniedException | IOException e ) {
			throw new HttpInternalServerErrorException( e );
		}
	}
}
