class ExpeditionsController < ApplicationController

  before_action :load_client

  def index
    @expeditions = @client.expeditions
      if params[:location_id]
        @expeditions = @expeditions.where("origin_location_id = ? OR destination_location_id = ?", params[:location_id], params[:location_id])
      end
  end

  def new
    @expedition = Expedition.new
  end

  def create
    @expedition = Expedition.new (expeditions_params)
    if @expedition.save
      redirect_to client_expeditions_path(@client)
    else
      render 'new'
    end
  end

  def show
    @expedition = Expedition.find_by(id: params[:id])
  end



  def edit
    @current_expedition = Expedition.find_by(id: params[:id])
  end

  def update
    @current_expedition = Expedition.find_by(id: params[:id])
    if @current_expedition.update_attributes(expeditions_params_update_state)
      redirect_to client_expeditions_path(@client.id)
    else
      render 'edit'
    end

  end

  def destroy
    @current_expedition = Expedition.find_by(id: params[:id])
    @current_expedition.destroy
    redirect_to client_expeditions_path(@client.id)
  end

  def import
    CSV.foreach(params[:file].path, col_sep:  ";") do |row|
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
    redirect_to client_locations_path, notice: "Expeditions imported correctly"
  end


  private
  def expeditions_params
    params.require(:expedition).permit(:origin_location_id, :destination_location_id, :date, :weight).merge(client_id: @client.id)
  end

  def expeditions_params_update_state
    params.require(:expedition).permit(:origin_location_id, :destination_location_id, :date, :weight, :state).merge(client_id: @client.id)
  end


  def load_client
    @client = Client.find(params[:client_id])
  end
end
