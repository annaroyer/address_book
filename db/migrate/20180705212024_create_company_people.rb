class CreateCompanyPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :company_people do |t|
      t.references :company
      t.references :person

      t.timestamps
    end
  end
end
