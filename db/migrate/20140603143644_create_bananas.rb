class CreateBananas < ActiveRecord::Migration
  def change
    create_table :bananas do |t|
      t.string :name
      t.string :species
    end
  end
end
