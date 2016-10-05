
class LocationsController < ApplicationController

  before_action :load_client
  before_action :transporter_redirect, except: :index

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
    CSV.foreach(params[:file].path, col_sep:  ";", headers: true) do |row|
      internal_code = row[0]
      name = row[1]
      direction = row[2]
      postal_code = row[3]
      hour_in = row[4]
      hour_out = row[5]
      contact = row[6]
      route = row[7]
      if Location.find_by(internal_code: internal_code)
        Location.find_by(internal_code: internal_code).update_attributes(:name => name, :internal_code => internal_code, :direction => direction, :postal_code => postal_code, :hour_in => hour_in, :hour_out => hour_out, :contact => contact, :route => route)

      else
        Location.create(:name => name, :internal_code => internal_code, :direction => direction, :postal_code => postal_code, :hour_in => hour_in, :hour_out => hour_out, :contact => contact, :route => route, :client_id => params[:client_id])
      end
    end
    redirect_to client_locations_path, notice: "Data imported correctly"
  end

  private
  def locations_params
    params.require(:location).permit(:name, :internal_code, :direction, :postal_code, :hour_in, :hour_ut, :contact, :route).merge(client_id: params[:client_id])
  end

  def load_client
    @client = Client.find(params[:client_id])
  end

  def transporter_redirect
    if current_user.transporter?
      redirect_to client_locations_path(@client.id)
    end
  end

end
