class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
