package org.webstories.core.story;

import java.util.List;

import javax.ejb.Local;

import org.webstories.core.auth.Logged;
import org.webstories.core.story.impl.FeaturedStory;
import org.webstories.core.story.impl.HomeStory;
import org.webstories.core.story.impl.EditorStoryDetails;
import org.webstories.core.story.impl.EditorStory;

@Local
public interface LocalStoryReader {
	List<HomeStory> userStories( Logged logged );
	List<FeaturedStory> featuredStories();
	EditorStoryDetails storyDetails( long idStory );
	EditorStory storyEditor( long idStory );
}
