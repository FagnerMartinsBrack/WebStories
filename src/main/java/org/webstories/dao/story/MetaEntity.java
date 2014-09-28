package org.webstories.dao.story;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.webstories.core.story.StoryMeta;

@Entity
@Table( name = "ws_meta" )
public class MetaEntity {
	@Column( nullable = false, length = 255 )
	private String ds_title;
	
	@Column( nullable = false, length = 255 )
	private String ds_summary;
	
	@Column( nullable = false )
	private String ds_synopsis;
	
	@OneToOne( optional = false )
	@JoinColumn( name = "id_story", nullable = false )
	private StoryEntity story;
	
	public static MetaEntity from( StoryMeta input ) {
		MetaEntity meta = new MetaEntity();
		meta.ds_title = input.getTitle();
		meta.ds_summary = input.getSummary();
		meta.ds_synopsis = input.getSynopsis();
		return meta;
	}
	
	public String getTitle() {
		return ds_title;
	}
	public String getSummary() {
		return ds_summary;
	}
	public String getSynopsis() {
		return ds_synopsis;
	}
	
	public StoryEntity getStory() {
		return story;
	}
	public void setStory( StoryEntity story ) {
		this.story = story;
	}
}
