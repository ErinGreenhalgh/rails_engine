class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :unit_price
      t.references :merchant, foreign_key: true

      t.timestamps null: false 
    end
  end
end
