require 'redmine'

Dir[File.join(__dir__, 'plugins', '*')].each do |dir|
  path = File.join(dir, 'lib')
  $LOAD_PATH << path
  ActiveSupport::Dependencies.load_paths << path
  ActiveSupport::Dependencies.load_once_paths.delete(path)
end

Redmine::Plugin.register :redmine_holidays_calendar do
  name 'Redmine Holidays Calendar plugin'
  author 'Alexander Klimenkov'
  description 'Holidays Calendar is a plugin to set a holidays / weekends date'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'https://github.com/AlexKlim'

  requires_redmine version_or_higher: '0.8.0'
  settings( partial: 'settings/holidays_calendar' )
  permission :see_project_timesheets, { }, require: :member
end
