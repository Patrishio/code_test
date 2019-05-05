require 'rails_helper'

describe "Api features", js: true do
  it "allows to send proper request" do
    visit root_path
    fill_in "name", with: "Anthony Hopkins"
    fill_in "business_name", with: "Company"
    fill_in "telephone_number", with: "07761728697"
    fill_in "email", with: "anthony@hopkins.kuku.com"
    binding.pry
    find('input[name="commit"]').click
    expect(page).to have_content("Please correct submitted data. Details: []")
  end
end