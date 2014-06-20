RedmineApp::Application.routes.draw do
  get 'redmine_holidays_calendar/calendar' => 'holidays_calendar#calendar'
end