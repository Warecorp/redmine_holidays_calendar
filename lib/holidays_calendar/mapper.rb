module HolidaysCalendar
  class Mapper
    def self.dates_day_off
      configuration = Setting.plugin_redmine_holidays_calendar
      if configuration['dates_day_off']
        return configuration['dates_day_off']
      end
    end
  end
end