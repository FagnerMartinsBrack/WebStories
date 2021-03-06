package org.webstories.dao.story;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

import org.webstories.dao.NumerableEntity;

@Entity
@Table( name = "ws_section" )
public class SectionEntity implements NumerableEntity, PositionableEntity,
Comparable<SectionEntity> {
	private SectionEntity() {}
	
	@Id
	@TableGenerator(
		name = "section_sequence",
		pkColumnValue = "section_sequence",
		table = "section_sequences",
		allocationSize = 1
	)
	@GeneratedValue( strategy = GenerationType.TABLE, generator = "section_sequence" )
	private Long id_section;
	
	@Column( nullable = false )
	private String ds_text = "";
	
	@Column( nullable = false )
	private Integer no_position;
	
	@ManyToOne
	@JoinColumn( name = "id_chapter", nullable = true )
	private ChapterEntity chapter;
	
	/**
	 * Method used for tests only
	 */
	public static SectionEntity createTestSection() {
		return new SectionEntity();
	}
	
	public static SectionEntity createEmptySection( int position ) {
		SectionEntity section = new SectionEntity();
		section.setPosition( position );
		return section;
	}
	
	@Override
	public Long getId() {
		return id_section;
	}
	
	public String getText() {
		return ds_text;
	}
	public void setText( String ds_text ) {
		this.ds_text = ds_text;
	}
	
	@Override
	public Integer getPosition() {
		return no_position;
	}
	@Override
	public void setPosition( Integer no_position ) {
		this.no_position = no_position;
	}
	
	public ChapterEntity getChapter() {
		return chapter;
	}
	protected void setChapter( ChapterEntity chapter ) {
		this.chapter = chapter;
	}
	@Override
	public int compareTo( SectionEntity other ) {
		if ( this.getPosition() > other.getPosition() ) {
			return 1;
		}
		if ( this.getPosition() < other.getPosition() ) {
			return -1;
		}
		return 0;
	}
}
