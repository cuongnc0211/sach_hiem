class AddFieldsToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :no_accents_title, :string
    add_column :authors, :no_accents_name, :string
  end
end
