class CreateTable < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :search_term

      t.timestamps
    end
  end
end
