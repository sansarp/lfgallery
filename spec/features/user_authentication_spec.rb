require_relative '../spec_helper'

describe "User Authentication" do 
	it "signup user" do
		visit '/users/sign_up'
		fill_in 'Email', with: 'connect.subash@gmail.com'
		fill_in 'Password', with: 'secret'
		fill_in 'user_password_confirmation', with: 'secret'
		
		click_button 'Sign up'
		save_and_open_page
		expect(page).to have_content 'signed up'
	end
	
end