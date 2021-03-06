package org.webstories.web.convention.pages.home;

import java.util.List;

import javax.ejb.EJB;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.webstories.core.auth.Logged;
import org.webstories.core.story.facade.LocalStoryAuthoringReader;
import org.webstories.core.story.thumb.HomeStory;
import org.webstories.web.util.servlet.AuthForwarded;
import org.webstories.web.util.servlet.BaseServlet;
import org.webstories.web.util.servlet.HttpUnauthorizedException;

import com.fagnerbrack.servlet.convention.ConventionServlet;

@WebServlet
@ConventionServlet
@AuthForwarded
@SuppressWarnings( "serial" )
public class ProjectsAction extends BaseServlet {
	@EJB
	LocalStoryAuthoringReader storyReader;
	
	@Override
	protected void doGet( HttpServletRequest request, HttpServletResponse response )
	throws HttpUnauthorizedException {
		Logged logged = getLogged( request );
		List<HomeStory> userStories = storyReader.authorStories( logged );
		request.setAttribute( "userStories", userStories );
		request.setAttribute( "nostory", userStories.isEmpty() );
		request.setAttribute( "firstStory", userStories.isEmpty() );
	}
}
