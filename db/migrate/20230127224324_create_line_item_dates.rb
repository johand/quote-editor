# frozen_string_literal: true

class CreateLineItemDates < ActiveRecord::Migration[7.0]
  def change
    create_table :line_item_dates, id: :uuid do |t|
      t.references :quote, null: false, foreign_key: true, type: :uuid
      t.date :date, null: false

      t.timestamps
    end

    # Adding uniqueness constraint for the couple date and quote_id
    add_index :line_item_dates, %i[date quote_id], unique: true
    # Adding index to the date field for performance reasons
    add_index :line_item_dates, :date
  end
end
