require_relative '../spec_helper'

describe "Sign in test" do 
	it "sign in user" do
		visit '/users/sign_in'
		fill_in 'Email', with: 'ojash@gmail.com'
		fill_in 'Password', with: 'someblas'
	
		click_button 'Sign in'
		save_and_open_page
		expect(page).to have_content 'Listing albums'
	end

end

