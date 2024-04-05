class Author < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["biography", "birth_date", "created_at", "id", "id_value", "name", "updated_at"]
  end
end
