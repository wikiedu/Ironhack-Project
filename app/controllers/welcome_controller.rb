class WelcomeController < ApplicationController
    before_action :load_client

  def index
  end
  def print
    
  end


  private
  def load_client
    @client = Client.find(params[:client_id])
  end
end
