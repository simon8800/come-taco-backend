# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.float :price
      t.string :category
      t.string :imgURL

      t.timestamps
    end
  end
end
