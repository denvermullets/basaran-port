class LandingController < ApplicationController
  def index; end

  def authenticate
    if params[:password] == ENV.fetch('PORTFOLIO_PASSWORD')
      session[:authenticated] = true
      redirect_to portfolio_path
    else
      flash[:alert] = 'Incorrect password'
      render :index
    end
  end
end
