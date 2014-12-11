define( ["jquery", "impress", "jquery.ui.widget"], function( $, impress ) {
	"use strict";
	$.widget( "ws.story", {
		_keyCodes: {
			ARROW_DOWN: 40,
			ARROW_LEFT: 37,
			ARROW_RIGHT: 39,
			ARROW_UP: 38,
			
			PAGE_DOWN: 34,
			PAGE_UP: 33,
			
			SPACE: 32,
			TAB: 9
		},
		_create: function() {
			this.element
				.removeClass( "hidden" );
			
			// Immediate return if impress is not supported 
			if ( $( ".impress-not-supported" ).length ) {
				return;
			}
			
			this._refresh();
			
			this._on( this.element, this._menuEvents );
			this._on( this.element, this._stepEvents );
			this._on( document.documentElement, this._globalEvents );
			
			this._impress = impress( "slides-container" );
			this._impress.init();
		},
		_menuEvents: {
			"click .story-next": function() {
				this._impress.goto( this._currentStep + 1 );
			},
			"click .story-prev": function() {
				this._impress.goto( this._currentStep - 1 );
			},
			"click .story-controls-prev-chapter": function() {
				var step = this._steps[ this._currentStep ];
				var chapter = this._chapters[ step.chapterIndex - 1 ];
				if ( !chapter ) {
					chapter = this._chapters[ 0 ];
				}
				this._impress.goto( chapter.step );
			},
			"click .story-controls-next-chapter": function() {
				var step = this._steps[ this._currentStep ];
				var chapter = this._chapters[ step.chapterIndex + 1 ];
				if ( !chapter ) {
					// No chapter left
					return;
				}
				this._impress.goto( chapter.step );
			},
			"click .story-stop": function() {
				this._impress.goto( 0 );
			}
		},
		_stepEvents: {
			"impress:stepenter .step": function( event ) {
				var stepElement = $( event.currentTarget );
				this._currentStep = stepElement.index();
				this._changeMenuState( stepElement );
			}
		},
		_globalEvents: {
			"impress:init": function( event ) {
				var api = event.originalEvent.detail.api;
				var events = {
					"keydown": function( event ) {
						switch ( event.keyCode ) {
							case this._keyCodes.PAGE_UP:
							case this._keyCodes.ARROW_LEFT:
							case this._keyCodes.ARROW_UP:
								this.element
									.find( ".story-prev" )
									.click();
								event.preventDefault();
								break;
							case this._keyCodes.TAB:
								var direction = event.shiftKey ? "prev" : "next";
								this.element
									.find( ".story-" + direction )
									.click();
								event.preventDefault();
								break;
							case this._keyCodes.SPACE:
							case this._keyCodes.PAGE_DOWN:
							case this._keyCodes.ARROW_RIGHT:
							case this._keyCodes.ARROW_DOWN:
								this.element
									.find( ".story-next" )
									.click();
								event.preventDefault();
								break;
						}
					}
				};
				this._on( document, events );
				if ( this.options.loaded ) {
					this.options.loaded();
				}
			}
		},
		_changeMenuState: function( stepElement ) {
			var chapterNumber;
			var step = this._steps[ this._currentStep ];
			var visibleChapterControls = stepElement.hasClass( "story-content-step" );
			var btnPrev = this.element.find( ".story-prev" );
			
			this.element
				.find( ".story-controls-prev-chapter, .story-controls-next-chapter" )
				.toggleClass( "story-controls-visible", visibleChapterControls );
				
			btnPrev.prop( "disabled", this._currentStep === 0 );
			this.element
				.find( ".story-next" )
				.prop( "disabled", this._currentStep === this._steps.length - 1 );
				
			// When the button is disabled and focused, impress arrows move the screen instead of
			// the steps
			if ( btnPrev.is( ":focus" ) ) {
				btnPrev.blur();
			}
			
			if ( step.hasOwnProperty( "chapterIndex" ) ) {
				chapterNumber = step.chapterIndex + 1;
				this.element
					.find( ".story-controls-prev-chapter" )
					.text( chapterNumber - 1 < 1 ? 1 : chapterNumber - 1 );
				this.element
					.find( ".story-controls-next-chapter" )
					.text(
						chapterNumber + 1 > this._chapters.length ?
							this._chapters.length : chapterNumber + 1
					);
			}
		},
		_refresh: function() {
			var refresh = {
				slideData: function() {
					var x = 0;
					var width = $( window ).width() * 2;
					this.element
						.find( ".step" )
						.each(function( index, slide ) {
							$( slide )
								.attr( "data-x", x );
							x += width;
						});
				},
				stepsData: function() {
					var chapterIndex = -1;
					var steps = this._steps = [];
					var chapters = this._chapters = [];
					
					// steps
					this.element
						.find( ".step" )
						.each(function( index, element ) {
							var stepObj = {};
							var step = $( element );
							if ( step.hasClass( "story-chapter" ) ) {
								chapterIndex += 1;
							}
							if ( step.hasClass( "story-content-step" ) ) {
								stepObj.chapterIndex = chapterIndex;
							}
							steps.push( stepObj );
						});
						
					// chapters
					this.element
						.find( ".step" )
						.each(function( index, element ) {
							var step = $( element );
							if ( step.hasClass( "story-chapter" ) ) {
								chapters.push({
									step: index
								});
							}
						});
				}
			};
			refresh.slideData.call( this );
			refresh.stepsData.call( this );
		}
	});
});
