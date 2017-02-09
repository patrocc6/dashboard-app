$(document).on('click', '.panel-heading span.clickable', function(e){
  collapsePanel($(this));
});

$(document).on('click', '#collapse', function(e) {
  collapsePanel($('.panel-heading span.clickable'));
});

function collapsePanel(element) {
  var $this = element;
  if(!$this.hasClass('panel-collapsed')) {
		$this.parents('.panel').find('.panel-body').slideUp();
		$this.addClass('panel-collapsed');
		$this.find('i').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
	} else {
		$this.parents('.panel').find('.panel-body').slideDown();
		$this.removeClass('panel-collapsed');
		$this.find('i').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
	}
}
