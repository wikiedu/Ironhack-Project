class WelcomeController < ApplicationController


  def index
  end

  private
  def load_client
    @client = Client.find(params[:client_id])
  end
end
