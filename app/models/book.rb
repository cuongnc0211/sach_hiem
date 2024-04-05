class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :book_versions, dependent: :destroy

  def self.ransackable_associations(auth_object = nil)
    ["author", "book_versions", "category"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["author_id", "category_id", "created_at", "description", "id", "id_value", "original_title", "publication_date", "status", "title", "updated_at"]
  end
end
