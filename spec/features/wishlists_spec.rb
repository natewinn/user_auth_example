require  'spec_helper'
include AuthenticationHelper

feature "wishlist" do
	let(:user) { FactoryGirl.create(:user)}

	scenario "creating a item" do
		login(user)

		visit "/items"

		fill_in "item[etsy_url]", with: "https://www.etsy.com/listing/167808520/made-to-order-gold-polka-dot-porcelain?ref=hp_so_crsl_l"
		click_button "Add Item"

		current_path.should eq('/items')

	end	

	# scenario "viewing a wishlist" do

	# end

end