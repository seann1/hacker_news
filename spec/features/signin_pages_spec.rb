require 'rails_helper'

describe "the signin process" do
  it "signs a user in who uses the right password" do
    visit '/sessions/new'
    user = User.create(:email => 'user@example.com', :password => 'password')
    fill_in 'Login', :with => 'user@example.com'
    fill_in 'password', :with => 'password'
    click_button 'Sign in'
    page.should have_content 'Welcome!'
  end

  it "gives a user an error who uses the wrong password" do
    visit '/sessions/new'
    user = User.create(:email => 'user@example.com', :password => 'password')
    fill_in 'Login', :with => 'user@example.com'
    fill_in 'Password', :with => 'wrong'
    click_button 'Sign in'
    page.should have_content 'wrong'
  end

end
