module HolidaysCalendar
  class Mapper
    include Redmine::I18n

    def self.dates_day_off
      configuration = Setting.plugin_redmine_holidays_calendar
      configuration && configuration['dates_day_off'] ? configuration['dates_day_off'] : ''
    end

    # 1 = Monday ... 7 = Sunday
    def self.first_wday
      first_day = 1
      case Setting.start_of_week.to_i
      when 1
        first_day = (1 - 1)%7 + 1
      when 6
        first_day = (6 - 1)%7 + 1
      when 7
        first_day = (7 - 1)%7 + 1
      else
        first_day = (l(:general_first_day_of_week).to_i - 1)%7 + 1
      end
    end
  end

end