# app/services/analytics_service.rb
class AnalyticsService
  @@search_data = []

  def record_search(ip_address, query)
    @user_ip = ip_address
    @user_query = query

    @@search_data << { ip_address: @user_ip, query: @user_query }
  end

  def save_complete_query
    # Process and create an Analytic record using only the last data
    last_search_data = @@search_data.last

    return unless last_search_data

    begin
      Analytic.create(ip_address: last_search_data[:ip_address], query: last_search_data[:query])
    rescue StandardError => e
      Rails.logger.error("Error saving analytic: #{e.message}")
    end

    @@search_data = []
  end
end
