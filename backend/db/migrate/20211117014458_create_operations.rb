class CreateOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :operations do |t|
      t.integer :categorycode, unique: true
      t.datetime :occurrencetime
      t.float :value
      t.references :store, null: false, foreign_key: true
      t.references :recipient, null: false, foreign_key: true

      t.timestamps
    end

    add_index :categories, :code, unique: true
    add_foreign_key :operations, :categories, column: :categorycode, primary_key: :code
  end
end
