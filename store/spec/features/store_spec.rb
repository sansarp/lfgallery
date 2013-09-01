require 'spec_helper'

describe "listing products" do
	it "lists pages in index page" do 
		Store.Product.create!(name: 'Nokia', price: 500)
		visit '/store/'
		expect(page).to have_content("Nokia")
	end
end