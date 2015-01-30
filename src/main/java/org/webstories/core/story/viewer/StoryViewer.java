package org.webstories.core.story.viewer;

import java.util.List;

public class StoryViewer {
	private List<StorySlide> slides;
	private boolean finished;
	
	public List<StorySlide> getSlides() {
		return slides;
	}
	public void setSlides( List<StorySlide> slides ) {
		this.slides = slides;
	}
	
	public boolean isFinished() {
		return finished;
	}
	public void setFinished( boolean finished ) {
		this.finished = finished;
	}
}
