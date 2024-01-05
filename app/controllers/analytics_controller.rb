class AnalyticsController < ApplicationController
  protect_from_forgery with: :null_session, only: [:call_analytics_service]

  def call_analytics_service
    AnalyticsService.new.save_complete_query
    puts 'call_analytics_service method was called!'
    head :no_content
  end
end
