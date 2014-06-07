class DropWishlists < ActiveRecord::Migration
  def down
  	drop_table :wishlists
  end
end
