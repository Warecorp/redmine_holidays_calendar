class HolidaysCalendarController < ApplicationController
  accept_api_auth :calendar
  before_action :require_admin

  def calendar
    respond_to do |format|
      format.json { render json: {days_off: HolidaysCalendar::Mapper.dates_day_off} }
    end
  end

end