class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :companies, :name
  end
end
