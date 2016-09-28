
class LocationsController < ApplicationController

  before_action :load_client

  def index
    @locations = @client.locations
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new (locations_params)
    if @location.save
      redirect_to client_locations_path(params[:client_id])
    else
      render 'new'
    end

  end

  def edit
    @current_location = Location.find_by(id: params[:id])
  end

  def update
    @current_location = Location.find_by(id: params[:id])
    if @current_location.update_attributes(locations_params)
      redirect_to client_locations_path(params[:client_id])
    else
      render 'edit'
    end

  end

  def destroy
    @current_location = Location.find_by(id: params[:id])
    @current_location.destroy
    redirect_to client_locations_path
  end

  def import
    CSV.foreach(params[:file].path, col_sep:  ";") do |row|
      id = row[0]
      name = row[1]
      direction = row[2]
      postalCode = row[3]
      hourIn = row[4]
      hourOut = row[5]
      contact = row[6]
      route = row[7]
      if Location.exists?(id)
        Location.find(id).update_attributes(:name => name, :direction => direction, :postalCode => postalCode, :hourIn => hourIn, :hourOut => hourOut, :contact => contact, :route => route)

      else
        Location.create(:name => name, :direction => direction, :postalCode => postalCode, :hourIn => hourIn, :hourOut => hourOut, :contact => contact, :route => route, :client_id => params[:client_id])
      end
    end
    redirect_to client_locations_path, notice: "Data imported correctly"
  end

  private
  def locations_params
    params.require(:location).permit(:name, :direction, :postalCode, :hourIn, :hourOut, :contact, :route).merge(client_id: params[:client_id])
  end

  def load_client
    @client = Client.find(params[:client_id])
  end

end
