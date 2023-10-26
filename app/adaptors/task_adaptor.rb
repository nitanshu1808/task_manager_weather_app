# frozen_string_literal: true

class TaskAdaptor
  attr_accessor :user, :data

  def initialize(user)
    @user = user
    @data = []
  end

  def build
    return [] if tasks.empty?

    verify_coordinates_presence
    tasks.each do |task|
      data << {
        title: task.title,
        description: task.description,
        due_date: task.due_date.strftime('%d/%m/%Y'),
        weather: fetch_weather_details(task),
      }
    end

    data
  end

  def location
    @location ||= user.location
  end

  def tasks
    @tasks ||= user.tasks
  end

  def verify_coordinates_presence
    return if location.lat.present? && location.lng.present?

    # Fetch Latitude and Longitude by location name using Geocoder
    lat, lng = Geocoder.search(location.name).first.coordinates
    location.update(lat: lat, lng: lng)
  end

  # Using Batch Loader and Parallel to avoid n+1 http calls
  def fetch_weather_details(task)
    BatchLoader.for(task).batch do |tasks, loader|
      Parallel.each(tasks, in_threads: 10) do |task|
        loader.call(task) do
          options = {
            lat: location.lat,
            lon: location.lng,
            units: :metric,
            dt: task.due_date.utc.to_i,
          }

          WeatherService.fetch(options)['data'].first
        end
      end
    end
  end
end
