class CreateCompanyAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :company_addresses do |t|
      t.references :company, foreign_key: true
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end
