class AddImageColumnToUsers < ActiveRecord::Migration
  def change
  	add_column :items, :url_570xN, :string
  end
end
