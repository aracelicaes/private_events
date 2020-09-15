require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  context "#Authentication" do
    it "enables me to create new user" do
      visit "/users/new"
  
      fill_in "Name", :with => "name"
      fill_in "Username", :with => "username"
      click_button "Create User"

      expect(page).to have_text("User was successfully created.")
    end

    it "disable me to create new user" do
      visit "/users/new"
  
      fill_in "Name", :with => "name"
      fill_in "Username", :with => "min"
      click_button "Create User"

      expect(page).to have_text("Username is too short (minimum is 4 characters)")
    end
  end
end
