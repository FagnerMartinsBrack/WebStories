define(function() {
	"use strict";
	function SlidesController( $scope, $document, SlidesStructure, SlidesBehavior ) {
		$scope.story.slides = [];
		$scope.init = function( storyId, isPreview ) {
			SlidesStructure
				.init( storyId, isPreview )
				.then(function() {
					$scope.loader.loaded = true;
				});
		};
		$scope.$watch( "story.slides", function( slides, oldSlides ) {
			if ( slides === oldSlides ) {
				return;
			}
			SlidesBehavior.handleChapterEnding( slides );
		}, true );
		$scope.$on( "slides:restructured", function( event, updateModel ) {
			var slidesGap = $document[ 0 ].documentElement.clientWidth * 2;
			updateModel( $scope.story, slidesGap );
		});
	}
	return [ "$scope", "$document", "SlidesStructure", "SlidesBehavior", SlidesController ];
});
