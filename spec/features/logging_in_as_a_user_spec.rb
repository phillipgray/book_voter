require 'rails_helper'

feature 'User Login' do

  before do
    @password = "yayaya1234"
    @email = 'hey@hey.com'
    User.create!(email: @email, password: @password, password_confirmation: @password)
  end

  scenario 'a user can login and logout' do
    visit root_path

    click_on "Log in"
    fill_in "Email", with: @email
    fill_in "Password", with: @password
    click_button "Log in"

    expect(page.text).to include("Log out")
    click_on "Log out"
  end
end
