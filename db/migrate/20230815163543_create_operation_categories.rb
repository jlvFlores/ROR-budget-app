class CreateOperationCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :operation_categories do |t|
      t.references :operation, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
