class CreateLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :logs do |t|
      t.references :plant, null: false, foreign_key: true
      t.string :categories
      t.text :content

      t.timestamps
    end
  end
end
