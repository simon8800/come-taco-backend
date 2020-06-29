class AddNameToCharges < ActiveRecord::Migration[5.2]
  def change
    add_column :charges, :name, :string
  end
end
