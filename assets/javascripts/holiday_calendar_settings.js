(function($) {
  var holidaysCalendar = function($element, options) {

    var datesDayOff = options.datesDayOff,
        firstDay = options.firstDay,
        $calendar = $('#calendar_dates_day_off');

    function init() {

      $calendar.multiDatesPicker({
        dateFormat: "yy-mm-dd",
        firstDay: firstDay,
        defaultDate: new Date()
      });

      if (datesDayOff != '') {
        $calendar.multiDatesPicker({
          addDates: datesDayOff.split(',')
        });
      }

      var $applyButton = $('input[name="commit"]');
      $applyButton[0].type = 'button';
      $applyButton.click(function() {
        var datesString = $('#calendar_dates_day_off').multiDatesPicker('getDates');
        $('#dates_day_off')[0].value = datesString;
        $applyButton.parent().submit();
      });
    }

    init();
  };

  $.fn.holidaysCalendar = function(options) {
    return this.each(function() {
      var $this = $(this);

      if (!$this.data('holidaysCalendar')) {
        $this.data('holidaysCalendar', holidaysCalendar($this, options));
      }
    });
  };
})(jQuery);
