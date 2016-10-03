class WelcomeController < ApplicationController

  skip_before_action :authenticate_user!
  def index
  end

  private
  def load_client
    @client = Client.find(params[:client_id])
  end
end
