class CreateBook < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :original_title
      t.text :description
      t.date :publication_date
      t.string :status

      t.references :author, null: true, foreign_key: true
      t.references :category, null: true, foreign_key: true

      t.timestamps
    end
  end
end
