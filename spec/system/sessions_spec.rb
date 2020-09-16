require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  before do
    User.create(name: 'aracelicaes', username: 'aracelicaes')
  end

  it "Logs me in" do
    visit '/login'
      fill_in 'name', with: 'aracelicaes'
      fill_in 'username', with: 'aracelicaes'
      click_button 'Sign in'
    expect(page).to have_content 'Sign In Succesful.'
  end

  it "Logs me out" do
    visit '/login'
    fill_in 'name', with: 'aracelicaes'
    fill_in 'username', with: 'aracelicaes'
    click_button 'Sign in'
    expect(find('#navigation')).to have_content('Logout')
  end
end


