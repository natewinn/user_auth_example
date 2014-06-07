class AddUrl170x135ToItem < ActiveRecord::Migration
  def change
  	add_column :items, :url_170x135, :string
  end
end
