require_relative '../spec_helper'

describe "Album Ownership" do
	it "logged in user can only create gallery" do
		user = User.create!(
			email: 'test@gmail.com',
			password: 'test'
			)
		user2 = User.create!(
			email: 'subash@gmail.com',
			password: 'test'
			)
		visit '/users/sign_in'
		# fill_in 'Email', with: 'test@gmail.com'
		# fill_in 'Password', with: 'test'
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_button 'Sign in'
		#save_and_open_page
		expect(page).to have_content 'Signed in successfully.'
		
		#visit new_album_path # '/albums/new'
	
		click_link "New Album"
		fill_in 'Title', with: 'Auto gallery'
		click_button 'Create Album'
		save_and_open_page
		expect(Album.last.title).to eq('Auto gallery')
		expect(Album.last.user).to eq(user)
		expect(Album.last.user).not_to eq(user2)
	end
end