require_relative '../spec_helper'

describe "Sign in test" do 
	before :each do
    User.create(:email => 'test@gmail.com', :password => 'test')
  end
	it "sign in user" do
		visit '/users/sign_in'
		fill_in 'Email', with: 'test@gmail.com'
		fill_in 'Password', with: 'test'
	
		click_button 'Sign in'
		save_and_open_page
		expect(page).to have_content 'Signed in successfully.'
	end

end

