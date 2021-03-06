define( ["jquery"], function( $ ) {
	"use strict";
	return {
		contextPath: "",
		loadComponent: function( url, data, success ) {
			if ( $.isFunction( data ) ) {
				success = data;
				data = undefined;
			}
			$.ajax({
				url: this.contextPath + url,
				dataType: "html",
				data: data,
				success: function() {
					var args = [].slice.call( arguments );
					var container = $( "<div>" ).append( args[ 0 ] );
					args[ 0 ] = container.find( "#wrapper-default" ).html();
					success.apply( this, args );
				}
			});
		}
	};
});
