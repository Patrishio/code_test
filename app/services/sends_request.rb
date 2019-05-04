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
end