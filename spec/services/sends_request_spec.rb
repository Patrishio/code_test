require 'rails_helper'

describe "Sends request" do
  let(:action)  { 
    SendsRequest.new(
    "Anthony Hopkins",
    "Chicken and Bean",
    "07761728968",
    "anthony@chickenendbean.com") 
  }
  
  it "generates form request" do
    expect(action.generate_form).to eq(
      [
        ['access_token', '58c26800e36979498609ecc7430ec7ca'],
        ['pGUID', 'CFFBF53F-6D89-4B5B-8B36-67A97F18EDEB'],
        ['pAccName', 'MicDevtest'],
        ['pPartner', 'MicDevtest'],
        ['name', 'Anthony Hopkins'],
        ['business_name', 'Chicken and Bean'],
        ['telephone_number', '07761728968'],
        ['email', 'anthony@chickenendbean.com']    
      ]
  
    )
  end
end