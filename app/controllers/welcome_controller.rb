class WelcomeController < ApplicationController
    before_action :load_client

  def index
  end
  def print
    if params[:expedition_id]
      original_url = request.base_url + "/clients/#{@client.id}/expeditions/#{params[:expedition_id]}"
      qr = RQRCode::QRCode.new( original_url)
      @svg = qr.as_svg(offset: 0, color: '000',
                    shape_rendering: 'crispEdges',
                    module_size: 4)
      @expedition = Expedition.find_by(id: params[:expedition_id])
      @single_qr = true
    else
      @expeditions = Expedition.all
      @svg_array = []
      @counter = 0
      @expeditions.each { |expedition|
        original_url = request.base_url + "/clients/#{@client.id}/expeditions/#{expedition.id}"
        qr = RQRCode::QRCode.new( original_url)
        svg = qr.as_svg(offset: 0, color: '000',
                      shape_rendering: 'crispEdges',
                      module_size: 4)
        @svg_array.push(svg)
        }
        @single_qr = false
    end

  end


  private
  def load_client
    @client = Client.find(params[:client_id])
  end
end
