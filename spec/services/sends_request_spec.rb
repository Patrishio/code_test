require 'rails_helper'

describe "Sends request" do

  let(:action)  { 
    SendsRequest.new(
    "Anthony Hopkins",
    "Chicken and Bean",
    "07761728968",
    "anthony@chickenendbean.com") 
  }
  
  # --------------------------------------
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

  # --------------------------------------
  it "sends valid requests" do   
    
    stub_request(:post, "http://mic-leads.dev-test.makeiteasy.com/api/v1/create").
      with(
        headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Content-Type'=>'multipart/form-data',
      'User-Agent'=>'Ruby'
        }).
    to_return(status: 200, body: "", headers: {})

  
    response = action.send 
    expect(response.code).to eq("200")   
  end

end