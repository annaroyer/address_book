class AddAddressToPerson < ActiveRecord::Migration[5.1]
  def change
    add_reference :people, :address
  end
end
