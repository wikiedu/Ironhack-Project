class ExpeditionsController < ApplicationController

  before_action :load_client
  before_action :transporter_redirect, except: [:index, :show, :update]


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

  def print
    @expeditions = Expedition.all
    if params[:id]
      @expeditions = @expeditions.where(id: params[:id])
    end
  end

  def edit
    @current_expedition = Expedition.find_by(id: params[:id])
    @states = [Expedition::STATE_DELIVERED, Expedition::STATE_PICKEDUP, Expedition::STATE_CANCELED]
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
      origin_location = row[0]
      destination_location = row[1]
      weight = row[2]
      state = row[3]
      date = row[4]
      if @client.locations.find_by(name: origin_location) && @client.locations.find_by(name: destination_location)
        Expedition.create(:origin_location_id => @client.locations.find_by(name: origin_location).id, :destination_location_id => @client.locations.find_by(name: destination_location).id, :weight => weight, :state => state, :date => date, :client_id => @client.id)
      end
    end
    redirect_to client_expeditions_path(@client.id), notice: "Expeditions imported correctly"
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

  def transporter_redirect
    if current_user.transporter?
      redirect_to client_expeditions_path(@client.id)
    end
  end


end
