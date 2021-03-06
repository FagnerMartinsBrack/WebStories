define( ["jquery", "webstories", "jquery.ui.widget", "bootstrap"], function( $, webstories ) {
	"use strict";
	$.widget( "ws.actionAlert", {
		_ajaxQueue: $({}),
		options: {
			load: function( closeable, loaded ) {
				webstories.loadComponent( "/components/alert-action?" + $.param({
					closeable: closeable
				}), loaded );
			}
		},
		_open: function( closeable, resolve ) {
			
			// Clear timeout each time an item is intended to be added to the queue.
			// After the next item, the client may or may not call "closeAfter" again.
			if ( this._closingTimeout ) {
				console.log( "Clearing last timeout, new item will be added to the queue" );
				clearTimeout( this._closingTimeout );
				delete this._closingTimeout;
			}
			
			var execute = function( next ) {
				this.options.load( closeable, function( html ) {
					
					this._opened = true;
					
					this._render( html );
					this._showElement();
					
					next();
					resolve();
				}.bind( this ));
			}.bind( this );
			
			this._ajaxQueue.queue( execute );
		},
		_render: function( html ) {
			if ( this._alert ) {
				this._alert
					.parents( ".alert-container" )
					.remove();
			}
			this._alert = $( html )
				.prependTo( this.element )
				.find( ".alert" );
		},
		_showElement: function() {
			this._alert
				.addClass( "in" )
				.parents( ".alert-container" )
				.removeClass( "hidden" );
		},
		_close: function() {
			function closed( event ) {
				this._alert
					.parents( ".alert-container" )
					.addClass( "hidden" );
				this._opened = false;
			}
			this._alert
				.removeClass( "in" )
				.one( "bsTransitionEnd", closed.bind( this ) )
				.emulateTransitionEnd( 150 );
		},
		_ajaxErrorMessages: {
			401: "Você não está logado.",
			403: "Acesso negado.",
			404: "O sistema não encontrou o caminho especificado.",
			500: "Ocorreu um erro interno no servidor."
		},
		closeAfter: function( millis ) {
			console.log( "closeAfter: " + millis + "ms" );
			this._closingTimeout = this._delay( this._close, millis );
		},
		show: function( text, closeable ) {
			console.log( "message: " + text );
			return new Promise( this._open.bind( this, closeable ) )
				.then(function() {
					this.element
						.find( ".alert-saving-text" )
						.html( text );
				}.bind( this ));
		},
		ajaxError: function( message, jqXHR ) {
			var error = this._ajaxErrorMessages[ jqXHR.status ];
			var content = [ message, error ].join( "<br>" );
			var closeable = true;
			this.show( content, closeable );
		},
		ajaxValidation: function( validation ) {
			if ( validation.length ) {
				this.show( validation[ 0 ].message );
			}
		}
	});
});
