require_relative '../spec_helper'

#Album is constant
describe Album do 
	it "title cannot be blank" do 
		album = Album.new(title: '')
		expect(album.valid?).to be(false)
		
	end

	it "show albums of logged in user only" do 
		user = User.create!(
			email: 'test@gmail.com',
			password: 'test'
			)
		visit '/users/sign_in'
		# fill_in 'Email', with: 'test@gmail.com'
		# fill_in 'Password', with: 'test'
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_button 'Sign in'
		expect(page).to have_content 'page11'

		
	end
end
