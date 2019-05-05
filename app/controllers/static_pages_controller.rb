class StaticPagesController < ApplicationController
  
  # ------------------------------------
  def home
  end

  # ------------------------------------
  def submit    
    sr = SendsRequest.new(
      params[:name],
      params[:business_name],
      params[:telephone_number],
      params[:email]
    )

    response = sr.send
    
    respond_to do |format|              
      if response.code == "201" || response.code == "200"
        flash.now[:info] = "Thank for your request. it was processed successfully."
        format.html { render :home }
      else
        flash.now[:danger] = "Please correct submitted data. Details: #{sr.errors}"
        format.html { render :home }
      end
    end    
  end

end
