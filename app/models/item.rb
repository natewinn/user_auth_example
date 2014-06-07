class Item < ActiveRecord::Base
	
	# def user_is_admin
	# 	user.admin?
	# end

	belongs_to :user

	before_create :get_etsy_id, :set_photo_from_etsy
	after_create :set_attributes_from_etsy, :set_photo_from_etsy

	def get_etsy_data
		response = HTTParty.get("https://openapi.etsy.com/v2/listings/#{self.etsy_id}?api_key=#{Rails.application.secrets.etsy_api_key}")
	end	

	def get_etsy_photo
		response = HTTParty.get("https://openapi.etsy.com/v2/listings/#{self.etsy_id}/images?api_key=#{Rails.application.secrets.etsy_api_key}")
	end

	def get_etsy_id
		string = self.etsy_url
		regex = /\d+/
		numbers = string.scan(regex)
		self[:etsy_id] = numbers[0]
	end

	def set_attributes_from_etsy
		etsy_data = get_etsy_data
		listing = etsy_data["results"][0]
		self[:name] = listing["title"]
		self[:description] = listing["description"]
		self[:price] = listing["price"]
		self[:etsy_url] = listing["etsy_url"]
		self[:num_favorers] = listing["num_favorers"]
		self.save
	end

	def set_photo_from_etsy
		etsy_photo = get_etsy_photo
		photo = etsy_photo["results"][0]
		self[:url_170x135] = photo["url_170x135"]
	end

end