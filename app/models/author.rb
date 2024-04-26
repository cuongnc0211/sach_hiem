class Author < ApplicationRecord
  has_many :books

  scope :alphabetical, -> { order(name: :asc) }

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def self.ransackable_attributes(auth_object = nil)
    ["biography", "birth_date", "created_at", "id", "id_value", "name", "updated_at"]
  end
end
