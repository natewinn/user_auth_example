class AddColumnsToItems < ActiveRecord::Migration
  def change
  	add_column :items, :price, :string
  	add_column :items, :num_favorers, :integer 
  end
end
