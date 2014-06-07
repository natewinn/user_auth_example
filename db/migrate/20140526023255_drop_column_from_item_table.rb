class DropColumnFromItemTable < ActiveRecord::Migration
  def change
  	remove_column :items, :url_570xN, :string 
  end
end
