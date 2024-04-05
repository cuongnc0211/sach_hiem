class CreateAuthor < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.text :biography
      t.date :birth_date

      t.timestamps
    end
  end
end
