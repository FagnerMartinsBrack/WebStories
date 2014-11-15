package org.webstories.core.story;

import java.util.ArrayList;
import java.util.List;

import org.webstories.core.validation.ChapterValidationObject;
import org.webstories.core.validation.SectionValidationObject;
import org.webstories.core.validation.ValidationObject;
import org.webstories.dao.story.ChapterEntity;
import org.webstories.dao.story.SectionEntity;
import org.webstories.dao.story.StoryEntity;

public class StoryUtils {
	/**
	 * Check if the story can be removed by the person who have rights to remove it, usually its
	 * author.
	 */
	public static boolean isRemovable( StoryEntity story ) {
		if ( story.getChapters().size() > 1 ) {
			return false;
		}
		if ( story.getChapters().size() == 1 ) {
			ChapterEntity chapter = story.getChapters().get( 0 );
			if ( chapter.getSections().size() > 1 ) {
				return false;
			}
		}
		return true;
	}
	
	/**
	 * Check if this chapter is valid for publication
	 */
	public static List<ValidationObject> validateChapter( ChapterEntity chapter ) {
		ArrayList<ValidationObject> result = new ArrayList<ValidationObject>();
		
		if ( chapter.getTitle().isEmpty() ) {
			result.add(new ChapterValidationObject(
				"The chapter title should not be empty"
			));
		}
		
		if ( chapter.getSections().isEmpty() ) {
			result.add(new ChapterValidationObject(
				"The chapter should have at least one section"
			));
		}
		
		for( SectionEntity section : chapter.getSections() ) {
			if ( section.getText().isEmpty() ) {
				result.add(new SectionValidationObject(
					"The chapter should have no empty section"
				));
			}
		}
		
		return result;
	}
}
