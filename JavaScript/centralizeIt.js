// CentralizeIt Script
// Author: Patrick finkbeiner <finkbeiner.patrick@gmail.com>
// github: https://github.com/pfinkbeiner

(function($){
    $.fn.extend({ 
        centralizeIt: function() {
			var selector = this;
			this.calc(selector);
			$(window).resize(function(){
				selector.calc(selector);
			});
        },
		calc: function(selector) {
			var totalHeight = selector.outerHeight();
			var windowHeight = $(document).height();
			var margin = Math.floor((windowHeight - totalHeight) / 2 );
			this.setPosition(selector, margin);
		},
		setPosition: function(selector, margin) {
			selector.css('margin-top', margin);
		}
    });
})(jQuery);
