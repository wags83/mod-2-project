class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.belongs_to :portfolio, null: false, foreign_key: true
      t.string :symbol
      t.float :purchase_price
      t.float :sell_price
      t.string :sell_date
      t.integer :num_shares

      t.timestamps
    end
  end
end
