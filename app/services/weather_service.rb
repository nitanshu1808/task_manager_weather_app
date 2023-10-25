# Service class for fetching weather details using open weather api
class WeatherService
  include HTTParty

  WEATHER_API_URL = 'https://api.openweathermap.org/data/3.0/onecall/timemachine'.freeze
  # Todo move to ENV variables
  WEATHER_APP_KEY = 'c29cd8314a51dd56d94fc98cbdf4874e'.freeze

  def self.fetch(options)
    options = options.merge(appid: WEATHER_APP_KEY).to_query
    response = get("#{WEATHER_API_URL}?#{options}")

    return response.parsed_response if response.success?

    # Todo add error
    { 'data' => [] }
  end
end
