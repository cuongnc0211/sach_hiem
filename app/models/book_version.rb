class BookVersion < ApplicationRecord
  belongs_to :book

  def self.ransackable_attributes(auth_object = nil)
    ["book_id", "created_at", "download_url", "file_type", "id", "id_value", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["book"]
  end
end
