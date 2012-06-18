var centralize = {
	mainContainer: 0,
	windowHeight: undefined,
	totalHeight: 0,
	margin: 0,
	it: function() {
		var me = this;
		me.calculate();	
		$(window).resize(function(){
			me.calculate();	
		});
	},
	calculate: function() {
		var me = this;
		me.mainContainer = $('.wrapper');
		me.totalHeight = me.mainContainer.outerHeight();
		me.windowHeight = $(document).height();
		me.margin = Math.floor((me.windowHeight - me.totalHeight) / 2 );
		me.mainContainer.css('margin-top', me.margin)
	}

}
