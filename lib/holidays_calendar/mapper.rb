module HolidaysCalendar
  class Mapper
    def self.dates_day_off
      configuration = Setting.plugin_redmine_holidays_calendar
      configuration && configuration['dates_day_off'] ? configuration['dates_day_off'] : ''
    end
  end
end