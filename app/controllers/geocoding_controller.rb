class GeocodingController < ApplicationController
  def update
    coordinates = "#{params[:lat]},#{params[:long]}"
    expeditions=Expedition.where(date: Date.today)
    expeditions.each do |expedition|
      if expedition.state != 'delivered'
        expedition.update_attribute(:geolocation, coordinates)
      end
    end
  end
end
