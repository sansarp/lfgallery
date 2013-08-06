require_relative '../spec_helper'

describe "User Authentication", :type=> :features do 
	before :each do
    	User.create(:email => 'test@gmail.com', :password => 'test')
  	end
	it "signup user" do
		visit '/users/sign_up'
		fill_in 'Email', with: 'connect.subash@gmail.com'
		fill_in 'Password', with: 'secret'
		fill_in 'user_password_confirmation', with: 'secret'
		
		click_button 'Sign up'
		save_and_open_page
		expect(page).to have_content 'signed up'
	end

	it "sign in user" do
		visit '/users/sign_in'
		#within ("#session") do
			fill_in 'Email', with: 'test@gmail.com'
			fill_in 'Password', with: 'test'
		#end
	
		click_button 'Sign in'
		save_and_open_page
		expect(page).to have_content 'Signed in successfully.'
	end
	
end