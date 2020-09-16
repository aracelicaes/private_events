require 'rails_helper'

RSpec.describe "Events", type: :system do
  before do
    driven_by(:rack_test)
  end

  context "#Events management" do
    it "Doesn't create event due to missing sign in." do
      visit "/events/new"
  
      fill_in "Title", :with => "name"
      fill_in "Location", :with => "username"
      fill_in "Description", :with => "name"
      click_button "Create Event"

      expect(page).to have_text("Please Sign In.")
    end
  end
end
