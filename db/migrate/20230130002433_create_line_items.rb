# frozen_string_literal: true

class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items, id: :uuid do |t|
      t.references :line_item_date, null: false, foreign_key: true, type: :uuid
      t.string :name, null: false
      t.text :description
      t.integer :quantity, null: false
      t.decimal :unit_price, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
