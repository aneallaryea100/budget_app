require_relative '../rails_helper'

RSpec.describe 'Group up page', type: :feature do
  before(:each) do
    visit new_user_registration_path
    @user = User.create(
      name: 'User1',
      email: 'user1@out.com',
      password: 'test1234'
    )
    visit user_session_path
    fill_in 'Email', with: @user.email.to_s
    fill_in 'Password', with: @user.password.to_s
    find("input[type='submit']").click

    @group1 = Group.new(name: 'first Group', icon: 'first icon', user_id: @user.id)
    @group1.save
  end

  it 'shows the view button' do
    visit groups_path
    expect(page).to have_content('View')
  end

  it 'shows the the title text' do
    visit groups_path
    expect(page).to have_content('All Catagories')
  end

  it 'should show the details' do
    visit groups_path
    click_link('View')
    expect(page.current_path).to eql(group_path(@group1))
  end

  it 'shows the user name' do
    expect(page).to have_content(@user.name.to_s)
  end

  it 'shows the Logo in the navbar' do
    expect(page).to have_content('TB💰')
  end

  it 'shows the Catagoies in the navbar' do
    expect(page).to have_content('Categories 📁')
  end

  it 'shows the catagory name' do
    visit groups_path
    expect(page).to have_content(@group1.name.capitalize.to_s)
  end

  it 'shows the total amount' do
    visit groups_path
    expect(page).to have_content('Total Amount:')
  end

  it 'shows the add new catagory button' do
    visit groups_path
    expect(page).to have_content('Add New Catagory')
  end
end
