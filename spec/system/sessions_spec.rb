require 'rails_helper'

RSpec.describe 'Sessions', type: :system do
  before do
    User.create(name: 'user', username: 'username')
  end

  it 'Logs me in' do
    visit '/login'
    fill_in 'name', with: 'user'
    fill_in 'username', with: 'username'
    click_button 'Sign in'
    expect(page).to have_content 'Sign In Succesful.'
  end

  it 'Logs me out' do
    visit '/login'
    fill_in 'name', with: 'user'
    fill_in 'username', with: 'username'
    click_button 'Sign in'
    expect(find('#navigation')).to have_content('Logout')
  end

  it 'Fails Login Due to Wrong Username' do
    visit '/login'
    fill_in 'name', with: 'user'
    fill_in 'username', with: 'foo'
    click_button 'Sign in'
    expect(page).to have_content 'Login failed.'
  end

  it 'Not Logged in so Finds Login Button' do
    visit '/login'
    fill_in 'name', with: ' '
    fill_in 'username', with: ' '
    click_button 'Sign in'
    expect(find('#navigation')).to have_content('Login')
  end
end
