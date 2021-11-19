class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.integer :code, unique: true
      t.string :description
      t.string :nature
      t.string :signal

      t.timestamps
    end
  end
end
