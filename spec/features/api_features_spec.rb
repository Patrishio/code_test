require 'rails_helper'

describe "Api features", js: true do
  it "allows to send proper request" do
    stub_request(:get, "https://github.com/mozilla/geckodriver/releases").
    with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Host'=>'github.com',
      'User-Agent'=>'Ruby'
      }).
    to_return(status: 200, body: "", headers: {})

    stub_request(:post, "http://mic-leads.dev-test.makeiteasy.com/api/v1/create").
    with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Content-Type'=>'multipart/form-data',
      'User-Agent'=>'Ruby'
      }).
    to_return(status: 200, body: "", headers: {})

    visit root_path
    fill_in "name", with: "Anthony Hopkins"
    fill_in "business_name", with: "Company"
    fill_in "telephone_number", with: "07761728697"
    fill_in "email", with: "anthony@hopkins.kuku.com"
    
    find('input[name="commit"]').click
    
    expect(page).to have_content("Thank for your request. it was processed successfully.")
  end

  it "doesn't allow to send not correct request" do

    stub_request(:post, "http://mic-leads.dev-test.makeiteasy.com/api/v1/create").
    with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Content-Type'=>'multipart/form-data',
      'User-Agent'=>'Ruby'
      }).
    to_return(status: 400, body: "{\"message\":\"Format errors on validation\",\"errors\":[\"Field 'name' wrong format, 'name' must be composed with 2 separated words (space between)\"]}", headers: {})    
    
    visit root_path
    fill_in "name", with: "Anthony"
    fill_in "business_name", with: "Company"
    fill_in "telephone_number", with: "07761728697"
    fill_in "email", with: "anthony@hopkins.kuku.com"

    find('input[name="commit"]').click

    expect(page).to have_content("Please correct submitted data. Details: [\"Field 'name' wrong format, 'name' must be composed with 2 separated words (space between)\"]")
  end
end