$(function() {
	$('#carousel').carouFredSel({
		width: $(window).width(),
		height: $(window).height(),
		align: false,
		auto: 10000,
		items: {
			visible: 1,
			width: 'variable',
			height: 'variable'
		}
	});

	$(window).resize(function() {
		var newCss = {
			width: $(window).width(),
			height: $(window).height()
		};
		$('#carousel').css( 'width', newCss.width*4 );
		$('#carousel').parent().css( newCss );
		$('#carousel div').css( newCss );
	}).resize();

	$('#carousel').trigger('configuration', ['auto.fx', 'crossfade']);
});