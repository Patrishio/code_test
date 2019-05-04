class StaticPagesController < ApplicationController
  
  def home
  end

  def submit
    SendsRequest.new(
      params[:name],
      params[:business_name],
      params[:telephone_number],
      params[:email]
    )
    
    respond_to do |format|
      format.html { render :home }
    end
    
  end
end
