class CreateCoffees < ActiveRecord::Migration[6.0]
  def change
    create_table :coffees do |t|
      t.string :name
      t.references :roast, null: false, foreign_key: true
      t.datetime :roasted_on
      t.references :grind, null: false, foreign_key: true
      t.references :tasting_notes, null: false, foreign_key: true

      t.timestamps
    end
  end
end
