class SendsRequest

  # --------------------------
  def initialize(
    name,
    business_name,
    telephone_number,
    email
  )
    @name = name
    @business_name = business_name
    @telephone_number = telephone_number
    @email = email
    @response = nil
  end

  # --------------------------
  def send
    uri = URI('http://mic-leads.dev-test.makeiteasy.com/api/v1/create')
    http = Net::HTTP.new(uri.host, uri.port)    
    request = Net::HTTP::Post.new(uri.request_uri)    
    request['Content-Type'] = "multipart/form-data"
    request.set_form self.generate_form, 'multipart/form-data'
    response = http.request(request)    
    @response = response
  end

  # --------------------------
  def generate_form
    [
      ['access_token', '58c26800e36979498609ecc7430ec7ca'],
      ['pGUID', 'CFFBF53F-6D89-4B5B-8B36-67A97F18EDEB'],
      ['pAccName', 'MicDevtest'],
      ['pPartner', 'MicDevtest'],
      ['name', @name],
      ['business_name', @business_name],
      ['telephone_number', @telephone_number],
      ['email', @email]    
    ]
  end  

  # --------------------------
  def errors
    jresponse = JSON.parse(@response.body)
    errors = jresponse["errors"]
  end  
end