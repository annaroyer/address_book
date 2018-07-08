class AddAddressToPerson < ActiveRecord::Migration[5.1]
  def change
    add_reference :people, :address, foreign_key: true
  end
end
