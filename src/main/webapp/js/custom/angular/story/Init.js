define([
	"angular",
	"js/story/service/StoryResource",
	"js/story/service/SlidesStructure",
	"js/story/service/SlidesManip",
	"js/story/service/ControlsManip",
	"js/story/service/StoryControls",
	"js/story/controller/PageController",
	"js/story/controller/StoryController",
	"js/story/controller/ControlsController",
	"js/story/controller/SlidesController",
	"js/global/directive/AlertDirective",
	"js/global/filter/HTMLTrustedFilter",
	"angular.resource",
	"angular.jmpress"
], function(
	angular,
	StoryResource,
	SlidesStructure,
	SlidesManip,
	ControlsManip,
	StoryControls,
	PageController,
	StoryController,
	ControlsController,
	SlidesController,
	AlertDirective,
	HTMLTrustedFilter
) {
	"use strict";
	angular.module( "ws.story", [ "ngResource", "jmpress" ] )
		.service( "StoryResource", StoryResource )
		.service( "SlidesStructure", SlidesStructure )
		.service( "SlidesManip", SlidesManip )
		.service( "ControlsManip", ControlsManip )
		.service( "StoryControls", StoryControls )
		.controller( "PageController", PageController )
		.controller( "StoryController", StoryController )
		.controller( "ControlsController", ControlsController )
		.controller( "SlidesController", SlidesController )
		.directive( "wsAlert", AlertDirective )
		.filter( "htmlTrusted", HTMLTrustedFilter );
	return angular.bootstrap( document.body, [ "ws.story" ] );
});
