namespace :holidays_calendar do

  desc 'Set days off'
  task :days_off, [:year] => :environment do |t, args|
    args.with_defaults year: Date.current.year
    year = args[:year]

    start_date = Date.parse("1-1-#{year}")
    end_date = start_date + 1.year - 1.day
    weekends = (start_date..end_date).to_a.select{ |d| [0,6].include?(d.wday) }

    configuration = Setting.plugin_redmine_holidays_calendar

    dates = if configuration && configuration['dates_day_off']
      last_days_off = configuration['dates_day_off'].split(',')
      weekends.reject!{ |d| last_days_off.include? d.to_s }
      configuration['dates_day_off'] + ",#{weekends.join(',')}"
    else
      weekends.join(',')
    end

    dates.slice!(0) if dates[0] == ','
    dates.chomp!(',')

    Setting.send 'plugin_redmine_holidays_calendar=', { 'dates_day_off' => dates }

    puts 'Done.'
  end
end