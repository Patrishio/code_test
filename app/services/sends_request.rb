class SendsRequest
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
  end

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
end