class CreateOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :operations do |t|
      t.string :name, null: false, default: ""
      t.decimal :amount, precision: 20, scale: 2, null: false, default: 0.0
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
