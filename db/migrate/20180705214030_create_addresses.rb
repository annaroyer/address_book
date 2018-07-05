class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.string :country
      t.string :locality
      t.string :po_box
      t.string :postal_code
      t.string :premises
      t.string :region

      t.timestamps
    end
  end
end
