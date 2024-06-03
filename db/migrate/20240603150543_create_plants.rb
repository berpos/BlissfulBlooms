class CreatePlants < ActiveRecord::Migration[7.1]
  def change
    create_table :plants do |t|
      t.integer :age
      t.string :name
      t.integer :level
      t.string :state
      t.references :location, null: false, foreign_key: true
      t.string :categories

      t.timestamps
    end
  end
end
