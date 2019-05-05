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

  def send
    uri = URI('http://mic-leads.dev-test.makeiteasy.com/api/v1')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri)
    request['x-api-key'] = @company.fedex_api_key
    request['Authorization'] = "Basic ZWQxYmY4OGYtNzJiNy00MDRiLWE2NmUtYWVlYTRlZmVjZTM2OmQ5NjVjNTdhLTllYTYtNDA3Mi04MjdlLTNjNzE0NTE4NmM1Mg=="
    request['Content-Type'] = "application/json"
    response = http.request(request)
    response
  end
  end
end
