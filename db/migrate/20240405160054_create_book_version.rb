class CreateBookVersion < ActiveRecord::Migration[7.1]
  def change
    create_table :book_versions do |t|
      t.string :file_type
      t.references :book, null: false, foreign_key: true
      t.string :download_url

      t.timestamps
    end
  end
end
