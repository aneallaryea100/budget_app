require_relative '../rails_helper'

RSpec.describe 'Sign up page', type: :feature do
  before :each do
    visit new_user_registration_path
    fill_in 'user[name]',
            with: 'Test User'
    fill_in 'user[email]',
            with: 'test@example.com'
    fill_in 'user[password]',
            with: 'test123'
    fill_in 'user[password_confirmation]',
            with: 'test123'
    click_button 'Sign up'
  end

  it 'should have app logo' do
    expect(page).to have_content('TB💰')
  end

  it 'should have a field label called name' do
    expect(page).to have_content('Sign Out 🚪')
  end
end
