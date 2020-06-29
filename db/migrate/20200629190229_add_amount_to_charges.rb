class AddAmountToCharges < ActiveRecord::Migration[5.2]
  def change
    add_column :charges, :amount, :float
  end
end
