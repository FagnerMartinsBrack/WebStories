package org.webstories.core.story.facade;

import javax.ejb.Local;

import org.webstories.core.ResourceNotFoundException;
import org.webstories.core.auth.Logged;
import org.webstories.core.security.AccessDeniedException;
import org.webstories.core.story.editor.EditorStoryChapter;
import org.webstories.core.story.editor.EditorStoryDetailsInput;
import org.webstories.core.story.editor.EditorStorySection;
import org.webstories.core.story.editor.RemovalResult;
import org.webstories.core.validation.ValidationException;

@Local
public interface LocalStoryManip {
	void updateMeta( long idStory, EditorStoryDetailsInput input, Logged logged )
		throws ValidationException, AccessDeniedException;
	void removeStory( long idStory, Logged logged )
		throws ValidationException, AccessDeniedException;
	void publishChapter( long idChapter, Logged logged )
		throws ValidationException, AccessDeniedException;
	EditorStoryChapter addChapter( long idStory, Logged logged )
		throws AccessDeniedException;
	RemovalResult removeSection( long idSection, Logged logged )
		throws AccessDeniedException, ResourceNotFoundException;
	EditorStorySection addSection( long idPrevSection, Logged logged )
		throws AccessDeniedException;
	EditorStorySection updateSection( long sectionId, String text, Logged logged )
		throws AccessDeniedException;
	EditorStoryChapter updateChapter( long chapterId, String title, Logged logged )
		throws AccessDeniedException;
}
