class CreateGrinds < ActiveRecord::Migration[6.0]
  def change
    create_table :grinds do |t|
      t.string :name

      t.timestamps
    end
  end
end
